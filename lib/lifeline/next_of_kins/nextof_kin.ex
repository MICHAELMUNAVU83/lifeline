defmodule Lifeline.NextOfKins.NextofKin do
  use Ecto.Schema
  import Ecto.Changeset

  schema "next_of_kins" do
    field :name, :string
    field :relation, :string
    field :phone_number, :string

    timestamps()
  end

  @doc false
  def changeset(nextof_kin, attrs) do
    nextof_kin
    |> cast(attrs, [:name, :phone_number, :relation])
    |> validate_required([:name, :phone_number, :relation])
  end
end
