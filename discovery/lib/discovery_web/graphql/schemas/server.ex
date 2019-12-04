defmodule DiscoveryWeb.Schemas.Routing.Server do
  use Absinthe.Schema.Notation

  object :server_queries do
    field :servers, list_of(:server) do
      resolve(&DiscoveryWeb.Resolvers.Routing.Server.servers/3)
    end

    field :server, :server do
      arg(:id, non_null(:id))
      resolve(&DiscoveryWeb.Resolvers.Routing.Server.server/3)
    end
  end

  object :server_mutations do
    field(:create_server, :server_response) do
      arg(:input, non_null(:server_create))

      resolve(&DiscoveryWeb.Resolvers.Routing.Server.create_server/3)
    end

    field(:update_server, :server_response) do
      arg(:input, non_null(:server_update))

      resolve(&DiscoveryWeb.Resolvers.Routing.Server.update_server/3)
    end

    field(:delete_server, :server_response) do
      arg(:id, non_null(:id))

      resolve(&DiscoveryWeb.Resolvers.Routing.Server.delete_server/3)
    end
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
  end

  object :server_response do
    field(:message, :string)
  end
end
