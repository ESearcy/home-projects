use Mix.Config

# We don't run a picontainer during test. If one is required,
# you can enable the picontainer option below.
config :node, NodeWeb.Endpoint,
  http: [port: 4002],
  picontainer: false

# Print only warnings and errors during test
config :logger, level: :warn
