defmodule Lifeline.DrugAllergiesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Lifeline.DrugAllergies` context.
  """

  @doc """
  Generate a drug_allergy.
  """
  def drug_allergy_fixture(attrs \\ %{}) do
    {:ok, drug_allergy} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Lifeline.DrugAllergies.create_drug_allergy()

    drug_allergy
  end
end
