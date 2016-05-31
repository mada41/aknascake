defmodule Aknascake.CakeTest do
  use Aknascake.ModelCase

  alias Aknascake.Cake

  @valid_attrs %{description: "some content", image: "some content", name: "some content", price: "120.5"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Cake.changeset(%Cake{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Cake.changeset(%Cake{}, @invalid_attrs)
    refute changeset.valid?
  end
end
