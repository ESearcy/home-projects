defmodule NodeWeb.Graphql.CommonResolvers do
  @moduledoc """
  Common GraphQL resolvers.
  """
  use Absinthe.Schema.Notation

  @doc """
  Split the :filter and :pagination args out into a two-tuple. Useful for filtered/paginated list queries.
  """
  @spec get_args_fields(map) :: {map, map}
  def get_args_fields(args) do
    {Map.get(args, :filter, %{}), Map.get(args, :pagination, %{})}
  end
end
