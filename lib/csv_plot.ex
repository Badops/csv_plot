defmodule CsvPlot do
  @moduledoc """
  CsvPlot keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  def decode_csv(file) do
    File.stream!(file) 
    |> CSV.decode()
    |> Enum.to_list()
  end

  # filters the list based on time period and non-empty value
  def filter(list, time_period) do
    Enum.filter(list, fn({:ok, inner_list}) ->       
      Enum.at(inner_list, 10) == time_period and Enum.at(inner_list, 12) != ""
    end)
  end

  def transform_list(list, column_index1 \\ 11, column_index2 \\ 12) do
    Enum.map(list, fn({:ok, inner_list}) ->
      [Enum.at(inner_list, column_index1), Enum.at(inner_list, column_index2)]
    end)
  end

  def separate_items(_list, list1 \\ [], list2 \\ [])
  def separate_items([], [_ | t1], [_ | t2]) do
    [t1, t2]
  end
  def separate_items([time, value | tail], list1, list2) do
    separate_items(tail, list1 ++ [time], list2 ++ [value]) 
  end
end
