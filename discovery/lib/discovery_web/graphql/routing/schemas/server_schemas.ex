defmodule DiscoveryWeb.Graphql.Routing.Schemas.ServerSchema do
  use Absinthe.Schema.Notation

  alias DiscoveryWeb.Graphql.Routing.Resolvers.ServerResolver

  object :server_queries do
    field :servers, :server_paginated_result do
      arg(:filter, :server_filter)
      arg(:pagination, :pagination_filter)

      resolve(&ServerResolver.list_servers_pagination/2)
    end

    field :server, :server do
      arg(:id, non_null(:id))
      resolve(&ServerResolver.server/3)
    end
  end

  object :server_mutations do
    field(:create_server, :server_in_response) do
      arg(:input, non_null(:server_create))

      resolve(&ServerResolver.create_server/3)
    end

    field(:update_server, :server_in_response) do
      arg(:input, non_null(:server_update))

      resolve(&ServerResolver.update_server/3)
    end

    field(:delete_server, :server_response) do
      arg(:id, non_null(:id))

      resolve(&ServerResolver.delete_server/3)
    end
  end

  object :server_paginated_result do
    @desc "currency Order list"
    field(:list, list_of(non_null(:server)))
    @desc "Pagination information."
    field(:pagination, :pagination)
  end

  input_object :server_filter do
    @desc "normal ID"
    field(:id, :integer)
    @desc "filter through currency orders based on type"
    field(:type, :string)
  end

  input_object :server_create do
    field(:alias, :string)
    field(:local_ip, :string)
    field(:public_ip, :string)
    field(:temp, :float)
    field(:type, :string)
  end

  input_object :server_update do
    field(:id, non_null(:id))
    field(:alias, :string)
    field(:containers_available, :integer)
    field(:containers_max, :integer)
    field(:local_ip, :string)
    field(:memory_available, :float)
    field(:memory_max, :float)
    field(:public_ip, :string)
    field(:temp, :float)
    field(:type, :string)
    field(:inserted_at, :string)
  end

  object :server do
    field(:id, non_null(:id))
    field(:alias, :string)
    field(:containers_available, :integer)
    field(:containers_max, :integer)
    field(:local_ip, :string)
    field(:memory_available, :float)
    field(:memory_max, :float)
    field(:public_ip, :string)
    field(:temp, :float)
    field(:type, :string)
    field(:inserted_at, :string)
  end

  object :server_in_response do
    field(:id, :id)
    field(:alias, :string)
    field(:containers_available, :integer)
    field(:containers_max, :integer)
    field(:local_ip, :string)
    field(:memory_available, :float)
    field(:memory_max, :float)
    field(:public_ip, :string)
    field(:temp, :float)
    field(:type, :string)
    field(:message, :string)
    field(:inserted_at, :string)
  end

  object :server_response do
    field(:message, :string)
  end
end
