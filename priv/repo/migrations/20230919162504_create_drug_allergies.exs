defmodule Lifeline.Repo.Migrations.CreateDrugAllergies do
  use Ecto.Migration

  def change do
    create table(:drug_allergies) do
      add :name, :string

      timestamps()
    end
  end
end
