use Mix.Config

config :discovery, DiscoveryWeb.Endpoint,
  load_from_system_env: true,
  url: [
    host: Application.get_env(:discovery, :app_hostname),
    port: Application.get_env(:discovery, :app_port)
  ],
  cache_static_manifest: "priv/static/cache_manifest.json"

# Do not print debug messages in production
config :logger, level: :info

config :discovery, DiscoveryWeb.Endpoint, server: true
