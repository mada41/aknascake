defmodule Aknascake.Repo.Migrations.CreateCake do
  use Ecto.Migration

  def change do
    create table(:cakes) do
      add :name, :string
      add :description, :text
      add :image, :string
      add :price, :float

      timestamps
    end

  end
end
