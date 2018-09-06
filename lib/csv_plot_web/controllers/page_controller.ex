defmodule CsvPlotWeb.PageController do
  use CsvPlotWeb, :controller

  def time_series(conn, _params) do
    time_series = CsvPlot.decode_csv()
    render(conn, "time_series.json", time_series: time_series)
  end

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
