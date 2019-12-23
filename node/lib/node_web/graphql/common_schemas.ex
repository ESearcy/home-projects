defmodule NodeWeb.Graphql.CommonSchema do
  @moduledoc """
  Objects and Input types that are commonly used when implementing a GraphQL module
  for a given resource.
  """
  use Absinthe.Schema.Notation

  object :pagination do
    @desc "Total number of results for given filter parameters."
    field(:total, :integer)
    @desc "Current page of the result set."
    field(:page, :integer)
    @desc "Maximum number of results per page."
    field(:page_size, :integer)
    @desc "Total number of pages in the current result set."
    field(:pages, :integer)
  end

  input_object :pagination_filter do
    @desc "Page of results to select from."
    field(:page, :integer)
    @desc "Maximum number of results per page."
    field(:page_size, :integer)
  end

  object :docker_container_message do
    field(:message, :string)
  end
end
