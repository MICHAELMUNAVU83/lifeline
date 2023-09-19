defmodule Lifeline.NextOfKins.NextofKin do
  use Ecto.Schema
  import Ecto.Changeset
  alias Lifeline.Users.User

  schema "next_of_kins" do
    field :name, :string
    field :relation, :string
    field :phone_number, :integer
    belongs_to :user, User, foreign_key: :user_id

    timestamps()
  end

  @doc false
  def changeset(nextof_kin, attrs) do
    nextof_kin
    |> cast(attrs, [:name, :phone_number, :relation, :user_id])
    |> validate_required([:name, :phone_number, :relation, :user_id])
  end
end
