defmodule DiscoveryWeb.Schema.MasterSchema do
  use Absinthe.Schema
  alias DiscoveryWeb.Schemas

  # import_types(Absinthe.Type.Custom)

  import_types(Schemas.Routing.Server)

  query do
    import_fields(:server_queries)
  end

  mutation do
    import_fields(:server_mutations)
  end

  def middleware(middleware, _field, %Absinthe.Type.Object{identifier: identifier})
      when identifier in [:mutation, :query, :subscription] do
    Enum.concat(middleware, [{{GondorWeb.Graphql.Middleware.ErrorResolver, :call}, []}])
  end

  def middleware(middleware, _field, _object) do
    middleware
  end
end
