import Config

if config_env() == :prod do
  secret_key_base =
    System.get_env("SECRET_KEY_BASE") ||
      raise """
      environment variable SECRET_KEY_BASE is missing.
      You can generate one by calling: mix phx.gen.secret
      """

  app_name =
    System.get_env("FLY_APP_NAME") ||
      raise "FLY_APP_NAME not available"

  config :weather_tracker, WeatherTrackerWeb.Endpoint,
    server: true,
    url: [host: "#{app_name}.fly.dev", port: 80],
    http: [
      port: String.to_integer(System.get_env("PORT") || "4000"),
      transport_options: [socket_opts: [:inet6]]
    ],
    secret_key_base: secret_key_base

  database_url =
    System.get_env("DATABASE_URL") ||
      raise """
      environment variable DATABASE_URL is missing.
      For example: ecto://USER:PASS@HOST/DATABASE
      """

  # This is a dummy DB so it does not matter at the moment
  config :weather_tracker, WeatherTracker.Repo,
    username: "tsdbadmin",
    password: "hdz#AN6cJ33-1I",
    database: "tsdb",
    hostname: "sqxgvc8wc7.jn3m3oigwr.tsdb.cloud.timescale.com",
    port: "34913",
    pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10")
end
