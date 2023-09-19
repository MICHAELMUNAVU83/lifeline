defmodule Lifeline.DrugAllergies.DrugAllergy do
  use Ecto.Schema
  import Ecto.Changeset
  alias Lifeline.Users.User

  schema "drug_allergies" do
    field :name, :string
    belongs_to :user, User, foreign_key: :user_id

    timestamps()
  end

  @doc false
  def changeset(drug_allergy, attrs) do
    drug_allergy
    |> cast(attrs, [:name, :user_id])
    |> validate_required([:name, :user_id])
  end
end
