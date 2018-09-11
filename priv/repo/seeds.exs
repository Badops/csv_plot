# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     CsvPlot.Repo.insert!(%CsvPlot.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

import CsvPlot
alias CsvPlot.CsvDomain

[time_list, value_list] = 
  decode_csv("./bis_credit_to_gdp.csv")
  |> filter("Q:AR:P:A:A")
  |> transform_list(11, 12)
  |> List.flatten()
  |> separate_items()

csv_params = %{time: time_list, value: value_list} 
CsvDomain.create_csv(csv_params)

