defmodule Aknascake.Cake do
  use Aknascake.Web, :model

  schema "cakes" do
    field :name, :string
    field :description, :string
    field :image, :string
    field :price, :float

    belongs_to :category, Aknascake.Category
    timestamps
  end

  @required_fields ~w(name image price category_id)
  @optional_fields ~w(description)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
