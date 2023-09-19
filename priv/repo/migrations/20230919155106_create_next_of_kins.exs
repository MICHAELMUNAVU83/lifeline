defmodule Lifeline.Repo.Migrations.CreateNextOfKins do
  use Ecto.Migration

  def change do
    create table(:next_of_kins) do
      add :name, :string
      add :phone_number, :string
      add :relation, :string

      timestamps()
    end
  end
end
