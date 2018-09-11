defmodule CsvPlot.CsvDomain do
  @moduledoc """
  The CsvDomain context.
  """

  import Ecto.Query, warn: false
  alias CsvPlot.Repo

  alias CsvPlot.CsvDomain.Csv

  @doc """
  Returns the list of csv.
  """
  def list_csv do
    Repo.all(Csv)
  end

  @doc """
  Gets a single csv.

  Raises `Ecto.NoResultsError` if the Csv does not exist.
  """
  def get_csv!(id), do: Repo.get!(Csv, id)

  @doc """
  Creates a csv.
  """
  def create_csv(attrs \\ %{}) do
    %Csv{}
    |> Csv.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a csv.
  """
  def update_csv(%Csv{} = csv, attrs) do
    csv
    |> Csv.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Csv.
  """
  def delete_csv(%Csv{} = csv) do
    Repo.delete(csv)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking csv changes.
  """
  def change_csv(%Csv{} = csv) do
    Csv.changeset(csv, %{})
  end
end
