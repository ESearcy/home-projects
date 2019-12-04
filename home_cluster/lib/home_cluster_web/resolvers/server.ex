defmodule HomeClusterWeb.Resolvers.Routing do
    alias HomeCluster.Routing
  
    def servers(_, _, _) do
      {:ok, Routing.list_servers()}
    end
  
    def server(_, %{id: id}, _) do
      {:ok, Routing.get_server!(id)}
    end

    def update_server(%{id: id, params: params}, _info) do
          {:ok, post} -> post |> Routing.update_server(params)
          {:error, _} -> {:error, "Post id #{id} not found"}
    end
  end