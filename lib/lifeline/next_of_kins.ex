defmodule Lifeline.NextOfKins do
  @moduledoc """
  The NextOfKins context.
  """

  import Ecto.Query, warn: false
  alias Lifeline.Repo

  alias Lifeline.NextOfKins.NextofKin

  @doc """
  Returns the list of next_of_kins.

  ## Examples

      iex> list_next_of_kins()
      [%NextofKin{}, ...]

  """
  def list_next_of_kins do
    Repo.all(NextofKin)
  end

  @doc """
  Gets a single nextof_kin.

  Raises `Ecto.NoResultsError` if the Nextof kin does not exist.

  ## Examples

      iex> get_nextof_kin!(123)
      %NextofKin{}

      iex> get_nextof_kin!(456)
      ** (Ecto.NoResultsError)

  """
  def get_nextof_kin!(id), do: Repo.get!(NextofKin, id)

  @doc """
  Creates a nextof_kin.

  ## Examples

      iex> create_nextof_kin(%{field: value})
      {:ok, %NextofKin{}}

      iex> create_nextof_kin(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_nextof_kin(attrs \\ %{}) do
    %NextofKin{}
    |> NextofKin.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a nextof_kin.

  ## Examples

      iex> update_nextof_kin(nextof_kin, %{field: new_value})
      {:ok, %NextofKin{}}

      iex> update_nextof_kin(nextof_kin, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_nextof_kin(%NextofKin{} = nextof_kin, attrs) do
    nextof_kin
    |> NextofKin.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a nextof_kin.

  ## Examples

      iex> delete_nextof_kin(nextof_kin)
      {:ok, %NextofKin{}}

      iex> delete_nextof_kin(nextof_kin)
      {:error, %Ecto.Changeset{}}

  """
  def delete_nextof_kin(%NextofKin{} = nextof_kin) do
    Repo.delete(nextof_kin)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking nextof_kin changes.

  ## Examples

      iex> change_nextof_kin(nextof_kin)
      %Ecto.Changeset{data: %NextofKin{}}

  """
  def change_nextof_kin(%NextofKin{} = nextof_kin, attrs \\ %{}) do
    NextofKin.changeset(nextof_kin, attrs)
  end
end
