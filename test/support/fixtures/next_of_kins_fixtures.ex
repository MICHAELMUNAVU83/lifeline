defmodule Lifeline.NextOfKinsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Lifeline.NextOfKins` context.
  """

  @doc """
  Generate a nextof_kin.
  """
  def nextof_kin_fixture(attrs \\ %{}) do
    {:ok, nextof_kin} =
      attrs
      |> Enum.into(%{
        name: "some name",
        relation: "some relation",
        phone_number: "some phone_number"
      })
      |> Lifeline.NextOfKins.create_nextof_kin()

    nextof_kin
  end
end
