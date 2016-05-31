defmodule Aknascake.Repo.Migrations.AddCategoryIdToCakes do
  use Ecto.Migration

  def change do
    alter table(:cakes) do
      add :category_id, references(:categories)
    end
    create index(:cakes, [:category_id])
  end
end
