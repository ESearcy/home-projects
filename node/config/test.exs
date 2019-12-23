use Mix.Config

# We don't run a docker_container during test. If one is required,
# you can enable the docker_container option below.
config :node, NodeWeb.Endpoint,
  http: [port: 4002],
  docker_container: false

# Print only warnings and errors during test
config :logger, level: :warn
