defmodule Aknascake.CakeController do
  use Aknascake.Web, :controller

  alias Aknascake.Cake

  plug :scrub_params, "cake" when action in [:create, :update]

  def index(conn, _params) do
    cakes = Repo.all(Cake)
    render(conn, "index.html", cakes: cakes)
  end

  def new(conn, _params) do
    changeset = Cake.changeset(%Cake{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"cake" => cake_params}) do
    changeset = Cake.changeset(%Cake{}, cake_params)

    case Repo.insert(changeset) do
      {:ok, _cake} ->
        conn
        |> put_flash(:info, "Cake created successfully.")
        |> redirect(to: cake_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    cake = Repo.get!(Cake, id)
    render(conn, "show.html", cake: cake)
  end

  def edit(conn, %{"id" => id}) do
    cake = Repo.get!(Cake, id)
    changeset = Cake.changeset(cake)
    render(conn, "edit.html", cake: cake, changeset: changeset)
  end

  def update(conn, %{"id" => id, "cake" => cake_params}) do
    cake = Repo.get!(Cake, id)
    changeset = Cake.changeset(cake, cake_params)

    case Repo.update(changeset) do
      {:ok, cake} ->
        conn
        |> put_flash(:info, "Cake updated successfully.")
        |> redirect(to: cake_path(conn, :show, cake))
      {:error, changeset} ->
        render(conn, "edit.html", cake: cake, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    cake = Repo.get!(Cake, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(cake)

    conn
    |> put_flash(:info, "Cake deleted successfully.")
    |> redirect(to: cake_path(conn, :index))
  end
end
