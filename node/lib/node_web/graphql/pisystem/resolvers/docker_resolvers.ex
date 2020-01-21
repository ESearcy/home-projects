defmodule NodeWeb.Graphql.Pisystem.Resolvers.DockerResolver do
  import NodeWeb.Graphql.CommonResolvers

  alias Node.Pisystem.Logics.DockerLogic

  def get_docker_container_by_id(_, %{id: id}, _) do
    ## verify role access
    DockerLogic.get_docker_container_by_id(id)
  end

  @spec list_docker_containers_pagination(map, map) :: any
  def list_docker_containers_pagination(args, _context) do
    ## filter based on role access
    {filter, pagination} = get_args_fields(args)

    docker_containers =
      DockerLogic.list_docker_containers_pagination(
        filter,
        pagination
      )

    docker_containers
  end
end
