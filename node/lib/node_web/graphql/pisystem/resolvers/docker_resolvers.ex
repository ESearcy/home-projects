defmodule NodeWeb.Graphql.Pisystem.Resolvers.DockerResolver do
  import NodeWeb.Graphql.CommonResolvers

  alias Node.Pisystem.Logics.DockerLogic

  def get_picontainer_by_id(_, %{id: id}, _) do
    ## verify role access
    DockerLogic.get_picontainer_by_id(id)
  end

  @spec list_picontainers_pagination(map, map) :: any
  def list_picontainers_pagination(args, _context) do
    ## filter based on role access
    {filter, pagination} = get_args_fields(args)

    picontainers =
      DockerLogic.list_picontainers_pagination(
        filter,
        pagination
      )

    picontainers
  end
end
