defmodule NodeWeb.Graphql.Schema.MasterSchema do
  use Absinthe.Schema

  # import_types(Absinthe.Type.Custom)

  import_types(NodeWeb.Graphql.Pisystem.Schemas.DockerSchema)
  import_types(NodeWeb.Graphql.CommonSchema)

  query do
    import_fields(:docker_container_queries)
  end

  def middleware(middleware, _field, %Absinthe.Type.Object{identifier: identifier})
      when identifier in [:mutation, :query, :subscription] do
    Enum.concat(middleware, [{{NodeWeb.Graphql.Middleware.ErrorResolver, :call}, []}])
  end

  def middleware(middleware, _field, _object) do
    middleware
  end
end
