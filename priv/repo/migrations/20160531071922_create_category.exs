defmodule Aknascake.Repo.Migrations.CreateCategory do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add :name, :string
      add :image, :string
      add :description, :string

      timestamps
    end

  end
end
