defmodule DiscoveryWeb.Router do
  use DiscoveryWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/" do
    pipe_through(:api)

    forward("/api", Absinthe.Plug, schema: DiscoveryWeb.Schema.MasterSchema)

    forward("/graphiql", Absinthe.Plug.GraphiQL,
      schema: DiscoveryWeb.Schema.MasterSchema,
      interface: :advanced
    )
  end
end
