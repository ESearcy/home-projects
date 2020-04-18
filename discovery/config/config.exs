# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :discovery,
  ecto_repos: [Discovery.Repo]

# Configures the endpoint
config :discovery, DiscoveryWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "bdkztQh0knZa7TIboDS0Zcxzag9x5vKUx5Ji8WaUpYMBxGZfn9zjaf22pmYgewSn",
  render_errors: [view: DiscoveryWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Discovery.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# github hooks and stuff
if Mix.env() != :prod do
  config :git_hooks,
    verbose: true,
    hooks: [
      pre_commit: [
        tasks: [
          "mix clean",
          "mix compile --warnings-as-errors",
          "mix xref deprecated --abort-if-any",
          "mix xref unreachable --abort-if-any",
          "mix format --check-formatted",
          "mix credo --config-file=.credo.exs list --all --strict --format=oneline",
          "mix doctor --summary",
          "mix test"
        ]
      ]
    ]
end

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
