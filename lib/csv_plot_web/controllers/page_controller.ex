defmodule CsvPlotWeb.PageController do
  use CsvPlotWeb, :controller
  alias CsvPlot.CsvDomain

  def time_series(conn, _params) do
    time_value_list = CsvDomain.list_csv
    render(conn, "time_value_list.json", time_value_list: time_value_list)
  end

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
