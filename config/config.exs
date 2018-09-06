# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :csv_plot,
  ecto_repos: [CsvPlot.Repo]

# Configures the endpoint
config :csv_plot, CsvPlotWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "6XgZkrbJIGEhoExAVwtLK9pl2DicNTcx/KZAMVT/hK77D6pj9+mBrX83eDS9bDMi",
  render_errors: [view: CsvPlotWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: CsvPlot.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
