defmodule Aknascake.CakeControllerTest do
  use Aknascake.ConnCase

  alias Aknascake.Cake
  @valid_attrs %{description: "some content", image: "some content", name: "some content", price: "120.5"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, cake_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing cakes"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, cake_path(conn, :new)
    assert html_response(conn, 200) =~ "New cake"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, cake_path(conn, :create), cake: @valid_attrs
    assert redirected_to(conn) == cake_path(conn, :index)
    assert Repo.get_by(Cake, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, cake_path(conn, :create), cake: @invalid_attrs
    assert html_response(conn, 200) =~ "New cake"
  end

  test "shows chosen resource", %{conn: conn} do
    cake = Repo.insert! %Cake{}
    conn = get conn, cake_path(conn, :show, cake)
    assert html_response(conn, 200) =~ "Show cake"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, cake_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    cake = Repo.insert! %Cake{}
    conn = get conn, cake_path(conn, :edit, cake)
    assert html_response(conn, 200) =~ "Edit cake"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    cake = Repo.insert! %Cake{}
    conn = put conn, cake_path(conn, :update, cake), cake: @valid_attrs
    assert redirected_to(conn) == cake_path(conn, :show, cake)
    assert Repo.get_by(Cake, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    cake = Repo.insert! %Cake{}
    conn = put conn, cake_path(conn, :update, cake), cake: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit cake"
  end

  test "deletes chosen resource", %{conn: conn} do
    cake = Repo.insert! %Cake{}
    conn = delete conn, cake_path(conn, :delete, cake)
    assert redirected_to(conn) == cake_path(conn, :index)
    refute Repo.get(Cake, cake.id)
  end
end
