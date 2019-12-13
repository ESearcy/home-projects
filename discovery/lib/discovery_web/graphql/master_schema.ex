defmodule DiscoveryWeb.Graphql.Schema.MasterSchema do
  use Absinthe.Schema

  # import_types(Absinthe.Type.Custom)

  import_types(DiscoveryWeb.Graphql.Routing.Schemas.ServerSchema)
  import_types(DiscoveryWeb.Graphql.CommonSchema)

  query do
    import_fields(:server_queries)
  end

  mutation do
    import_fields(:server_mutations)
  end

  def middleware(middleware, _field, %Absinthe.Type.Object{identifier: identifier})
      when identifier in [:mutation, :query, :subscription] do
    Enum.concat(middleware, [{{DiscoveryWeb.Graphql.Middleware.ErrorResolver, :call}, []}])
  end

  def middleware(middleware, _field, _object) do
    middleware
  end
end
