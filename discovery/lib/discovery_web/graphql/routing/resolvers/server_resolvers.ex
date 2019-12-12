defmodule DiscoveryWeb.Graphql.Routing.ServerResolvers do
  import DiscoveryWeb.Graphql.CommonResolvers

  alias Discovery.Routing.ServerRepository
  alias Discovery.Routing.ServerLogic
  alias Discovery.Routing.ServerSchema

  def servers(_, _, _) do
    ## verify role access
    ServerLogic.list_servers()
  end

  def server(_, %{id: id}, _) do
    ## verify role access
    ServerLogic.get_server(id)
  end

  def create_server(_, args, _) do
    ## verify role access
    ServerLogic.create_server(args)
  end

  @spec list_servers_pagination(map, map) ::
          Resolvers.paginated_result_t(ServerSchema.t())
  def list_servers_pagination(args, _context) do
    ## filter based on role access
    {filter, pagination} = get_args_fields(args)

    servers =
      ServerLogic.list_servers_pagination(
        filter,
        pagination
      )

    servers
  end

  def update_server(_, args, _) do
    ServerLogic.update_server(args)
  end

  def delete_server(_, %{id: id}, _) do
    ## verify role access
    ServerLogic.delete_server(id)
  end
end
