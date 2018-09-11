defmodule CsvPlot.Repo.Migrations.CreateCsv do
  use Ecto.Migration

  def change do
    create table(:csv) do
      add :time, {:array, :string}
      add :value, {:array, :string}

      timestamps()
    end

  end
end
