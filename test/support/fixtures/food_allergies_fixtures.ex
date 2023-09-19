defmodule Lifeline.FoodAllergiesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Lifeline.FoodAllergies` context.
  """

  @doc """
  Generate a food_allergy.
  """
  def food_allergy_fixture(attrs \\ %{}) do
    {:ok, food_allergy} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Lifeline.FoodAllergies.create_food_allergy()

    food_allergy
  end
end
