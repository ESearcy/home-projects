defmodule ExampleWeb.Router do
  use ExampleWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/" do
    pipe_through(:api)

    forward("/api", Absinthe.Plug, schema: ExampleWeb.Schema.MasterSchema)

    forward("/graphiql", Absinthe.Plug.GraphiQL,
      schema: ExampleWeb.Schema.MasterSchema,
      interface: :simple
    )
  end
end
