defmodule CsvPlotWeb.PageView do
  use CsvPlotWeb, :view

  def render("time_series.json", %{time_series: [time_list, value_list]}) do
    %{times: time_list, values: value_list}
  end
end
