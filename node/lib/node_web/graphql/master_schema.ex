defmodule NodeWeb.Graphql.Schema.MasterSchema do
  use Absinthe.Schema

  # import_types(Absinthe.Type.Custom)

  import_types(NodeWeb.Graphql.Pisystem.Schemas.PicontainerSchema)
  import_types(NodeWeb.Graphql.CommonSchema)

  query do
    import_fields(:picontainer_queries)
  end

  def middleware(middleware, _field, %Absinthe.Type.Object{identifier: identifier})
      when identifier in [:mutation, :query, :subscription] do
    Enum.concat(middleware, [{{NodeWeb.Graphql.Middleware.ErrorResolver, :call}, []}])
  end

  def middleware(middleware, _field, _object) do
    middleware
  end
end
