defmodule Lifeline.Repo.Migrations.CreateFoodAllergies do
  use Ecto.Migration

  def change do
    create table(:food_allergies) do
      add :name, :string

      timestamps()
    end
  end
end
