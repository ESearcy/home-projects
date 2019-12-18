defmodule DiscoveryWeb.Graphql.Routing.Resolvers.ServerResolver do
  import DiscoveryWeb.Graphql.CommonResolvers

  alias Discovery.Routing.Logics.ServerLogic
  alias Discovery.Routing.Schemas.ServerSchema

  def get_server_by_serial(_, %{serial_number: serial_number}, _) do
    ## verify role access
    ServerLogic.get_server_by_serial(serial_number)
  end

  def process_server_ping(_, args, _) do
    ## verify role access
    ServerLogic.process_server_ping(args.input)
  end

  @spec list_servers_pagination(map, map) :: Resolvers.paginated_result_t(ServerSchema.t())
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
end
