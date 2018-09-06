defmodule CsvPlot do
  @moduledoc """
  CsvPlot keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  def decode_csv() do
    File.stream!("./bis_credit_to_gdp.csv") 
    |> CSV.decode()
    |> Enum.to_list()
    |> filter()
    |> transform_list()
    |> List.flatten()
    |> separate_items([], [])
  end

  # filters the list using the time period "Q:AR:P:A:A" and non-empty value
  defp filter(list) do
    Enum.filter(list, fn({:ok, inner_list}) ->       
      Enum.at(inner_list, 10) == "Q:AR:P:A:A" and Enum.at(inner_list, 12) != ""
    end)
  end

  defp transform_list(list) do
    Enum.map(list, fn({:ok, inner_list}) ->
      [Enum.at(inner_list, 11), Enum.at(inner_list, 12)]
    end)
  end

  defp separate_items([], list1, list2) do
    [list1, list2]
  end

  defp separate_items([time, value | tail], list1, list2) do
    separate_items(tail, list1 ++ [time], list2 ++ [value]) 
  end
end
