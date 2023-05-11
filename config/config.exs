import Config

config :ash, :use_all_identities_in_manage_relationship?, false

config :shuttle_api, :ash_apis, [ShuttleApi.Booking]

config :shuttle_api, ecto_repos: [ShuttleApi.Repo ]

config :mime, :types, %{
  "application/vnd.api+json" => ["json"]
}




import_config "#{config_env()}.exs"
