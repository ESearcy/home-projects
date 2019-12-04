defmodule HomeClusterWeb.Router do
  use HomeClusterWeb, :router

  pipeline :graphql do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through(:graphql)

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: HomeClusterWeb.Schema.Server,
      interface: :playground
  end
end