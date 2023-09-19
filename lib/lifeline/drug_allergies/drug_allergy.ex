defmodule Lifeline.DrugAllergies.DrugAllergy do
  use Ecto.Schema
  import Ecto.Changeset

  schema "drug_allergies" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(drug_allergy, attrs) do
    drug_allergy
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
