import Config

# Configure your database
config :bus_api, BusApi.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "bus_api_dev",
  port: 5432,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10
