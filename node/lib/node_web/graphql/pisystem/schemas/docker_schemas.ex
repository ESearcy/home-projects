defmodule NodeWeb.Graphql.Pisystem.Schemas.DockerSchema do
  use Absinthe.Schema.Notation

  alias NodeWeb.Graphql.Pisystem.Resolvers.DockerResolver

  object :docker_container_queries do
    field :docker_containers, :docker_container_paginated_result do
      arg(:filter, :docker_container_filter)
      arg(:pagination, :pagination_filter)

      resolve(&DockerResolver.list_docker_containers_pagination/2)
    end

    field :docker_container, :docker_container do
      arg(:id, non_null(:string))
      resolve(&DockerResolver.get_docker_container_by_id/3)
    end
  end

  object :docker_container_paginated_result do
    @desc "pi containers list"
    field(:list, list_of(non_null(:docker_container)))
    @desc "Pagination information."
    field(:pagination, :pagination)
  end

  input_object :docker_container_filter do
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

  object :docker_container do
    field(:id, non_null(:string))
    field(:image, :string)
    field(:status, :string)
    field(:ports, :string)
    field(:names, :string)
  end
end
