defmodule HomeClusterWeb.Schema.Server do
    use Absinthe.Schema

    alias HomeClusterWeb.Resolvers.Routing

    query do

        # Queries
        @desc "Get a list of servers"
        field :servers, list_of(:server) do
            resolve &Routing.servers/3
        end 
    
        @desc "Get a server by its id"
        field :server, :server do
            arg :id, non_null(:id)
            resolve &Routing.server/3
        end

        # Mutations
        mutation do
            field :create_server, type: :server do
            arg(:input, :server_attributes_params)

            resolve(&Routing.create_server/2)
        end

        field :update_server, type: :server do
            arg(:id, non_null(:id))
            arg(:input, :server_attributes_params)

            resolve(&Routing.update_server/2)
        end

        field :delete_server, type: :server do
            arg(:id, non_null(:id))
            resolve(&Routing.delete_server/2)
        end 
      end
    end
  
    object :server do
        field :id, :integer
        field :local_ip, :string
        field :memory_max, :integer
        field :memory_used, :integer
        field :name, :string
        field :public_ip, :string
        field :type, :string
    end

    input_object :server_attributes_params do
        field :local_ip, :string
        field :memory_max, :integer
        field :memory_used, :integer
        field :name, :string
        field :public_ip, :string
        field :type, :string
    end
  end