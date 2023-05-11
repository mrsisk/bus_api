import Config

# Configure your database
config :shuttle_api, ShuttleApi.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "shuttle_api_dev",
  port: 5432,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10
