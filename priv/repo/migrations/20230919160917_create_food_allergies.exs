defmodule Lifeline.Repo.Migrations.CreateFoodAllergies do
  use Ecto.Migration

  def change do
    create table(:food_allergies) do
      add :name, :string
      add :user_id, :integer

      timestamps()
    end

    create index(:food_allergies, [:user_id])
  end
end
