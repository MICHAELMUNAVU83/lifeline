defmodule Lifeline.FoodAllergies.FoodAllergy do
  use Ecto.Schema
  import Ecto.Changeset

  schema "food_allergies" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(food_allergy, attrs) do
    food_allergy
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
