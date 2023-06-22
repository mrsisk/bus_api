import Config

config :ash, :use_all_identities_in_manage_relationship?, false

config :bus_api, :ash_apis, [BusApi.Booking]

config :bus_api, ecto_repos: [BusApi.Repo]

config :mime, :types, %{
  "application/vnd.api+json" => ["json"]
}

import_config "#{config_env()}.exs"
