defmodule CsvPlot.CsvDomainTest do
  use CsvPlot.DataCase

  alias CsvPlot.CsvDomain

  describe "csv" do
    alias CsvPlot.CsvDomain.Csv

    @valid_attrs %{list_of_rows: []}
    @update_attrs %{list_of_rows: []}
    @invalid_attrs %{list_of_rows: nil}

    def csv_fixture(attrs \\ %{}) do
      {:ok, csv} =
        attrs
        |> Enum.into(@valid_attrs)
        |> CsvDomain.create_csv()

      csv
    end

    test "list_csv/0 returns all csv" do
      csv = csv_fixture()
      assert CsvDomain.list_csv() == [csv]
    end

    test "get_csv!/1 returns the csv with given id" do
      csv = csv_fixture()
      assert CsvDomain.get_csv!(csv.id) == csv
    end

    test "create_csv/1 with valid data creates a csv" do
      assert {:ok, %Csv{} = csv} = CsvDomain.create_csv(@valid_attrs)
      assert csv.list_of_rows == []
    end

    test "create_csv/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = CsvDomain.create_csv(@invalid_attrs)
    end

    test "update_csv/2 with valid data updates the csv" do
      csv = csv_fixture()
      assert {:ok, csv} = CsvDomain.update_csv(csv, @update_attrs)
      assert %Csv{} = csv
      assert csv.list_of_rows == []
    end

    test "update_csv/2 with invalid data returns error changeset" do
      csv = csv_fixture()
      assert {:error, %Ecto.Changeset{}} = CsvDomain.update_csv(csv, @invalid_attrs)
      assert csv == CsvDomain.get_csv!(csv.id)
    end

    test "delete_csv/1 deletes the csv" do
      csv = csv_fixture()
      assert {:ok, %Csv{}} = CsvDomain.delete_csv(csv)
      assert_raise Ecto.NoResultsError, fn -> CsvDomain.get_csv!(csv.id) end
    end

    test "change_csv/1 returns a csv changeset" do
      csv = csv_fixture()
      assert %Ecto.Changeset{} = CsvDomain.change_csv(csv)
    end
  end
end
