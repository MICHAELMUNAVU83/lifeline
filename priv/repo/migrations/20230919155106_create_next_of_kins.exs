defmodule Lifeline.Repo.Migrations.CreateNextOfKins do
  use Ecto.Migration

  def change do
    create table(:next_of_kins) do
      add :name, :string
      add :phone_number, :integer
      add :relation, :string
      add :user_id, :integer

      timestamps()
    end

    create index(:next_of_kins, [:user_id])
  end
end
