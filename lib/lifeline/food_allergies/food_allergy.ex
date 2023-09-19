defmodule Lifeline.FoodAllergies.FoodAllergy do
  use Ecto.Schema
  import Ecto.Changeset
  alias Lifeline.Users.User

  schema "food_allergies" do
    field :name, :string
    belongs_to :user, User, foreign_key: :user_id

    timestamps()
  end

  @doc false
  def changeset(food_allergy, attrs) do
    food_allergy
    |> cast(attrs, [:name, :user_id])
    |> validate_required([:name, :user_id])
  end
end
