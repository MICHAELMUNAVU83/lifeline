defmodule Lifeline.Repo.Migrations.CreateDrugAllergies do
  use Ecto.Migration

  def change do
    create table(:drug_allergies) do
      add :name, :string
      add :user_id, :integer

      timestamps()
    end

    create index(:drug_allergies, [:user_id])
  end
end
