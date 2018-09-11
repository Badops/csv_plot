defmodule CsvPlot.CsvDomain.Csv do
  use Ecto.Schema
  import Ecto.Changeset

  schema "csv" do
    field :time, {:array, :string}
    field :value, {:array, :string}

    timestamps()
  end

  @required_fields [:time, :value]
  @optional_fields []

  @doc false
  def changeset(csv, attrs) do
    csv
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
