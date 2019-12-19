# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :node,
  ecto_repos: [Node.Repo]

# Configures the endpoint
config :node, NodeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "bdkztQh0knZa7TIboDS0Zcxzag9x5vKUx5Ji8WaUpYMBxGZfn9zjaf22pmYgewSn",
  render_errors: [view: NodeWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Node.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
