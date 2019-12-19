defmodule NodeWeb.Router do
  use NodeWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/" do
    pipe_through(:api)

    forward("/api", Absinthe.Plug, schema: NodeWeb.Graphql.Schema.MasterSchema)

    forward("/graphiql", Absinthe.Plug.GraphiQL,
      schema: NodeWeb.Graphql.Schema.MasterSchema,
      interface: :advanced
    )
  end
end
