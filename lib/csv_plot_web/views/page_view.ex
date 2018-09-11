defmodule CsvPlotWeb.PageView do
  use CsvPlotWeb, :view
  alias CsvPlotWeb.PageView

  def render("time_value_list.json", %{time_value_list: [csv_params]}) do
    %{times: csv_params.time, values: csv_params.value}
  end
end

