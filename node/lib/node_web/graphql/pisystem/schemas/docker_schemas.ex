defmodule NodeWeb.Graphql.Pisystem.Schemas.PicontainerSchema do
  use Absinthe.Schema.Notation

  alias NodeWeb.Graphql.Pisystem.Resolvers.PicontainerResolver

  object :picontainer_queries do
    field :picontainers, :picontainer_paginated_result do
      arg(:filter, :picontainer_filter)
      arg(:pagination, :pagination_filter)

      resolve(&PicontainerResolver.list_picontainers_pagination/2)
    end

    field :picontainer, :picontainer do
      arg(:id, non_null(:string))
      resolve(&PicontainerResolver.get_picontainer_by_id/3)
    end
  end

  object :picontainer_paginated_result do
    @desc "pi containers list"
    field(:list, list_of(non_null(:picontainer)))
    @desc "Pagination information."
    field(:pagination, :pagination)
  end

  input_object :picontainer_filter do
    @desc "normal ID"
    field(:id, list_of(:string))
    @desc "filter through containers orders based on type"
    field(:status, list_of(:string))
    @desc "filter through containers based on name"
    field(:names, list_of(:string))
    @desc "filter through containers based on image type"
    field(:image, list_of(:string))
    @desc "filter through containers based on ports"
    field(:ports, list_of(:string))
  end

  object :picontainer do
    field(:id, non_null(:string))
    field(:image, :string)
    field(:status, :string)
    field(:ports, :string)
    field(:names, :string)
  end
end
