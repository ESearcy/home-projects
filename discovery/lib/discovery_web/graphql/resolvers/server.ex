defmodule DiscoveryWeb.Resolvers.Routing.Server do
  alias Discovery.Routing

  def servers(_, _, _) do
    {:ok, Routing.list_servers()}
  end

  def server(_, %{id: id}, _) do
    {:ok, Routing.get_server!(id)}
  end

  def create_server(_, args, _) do
    with {:ok, _} <- Routing.create_server(args) do
      {:ok, %{message: "server created"}}
    end
  end

  def update_server(_, args, _) do
    with {:ok, server} <- Routing.get_server!(args.input.id) |> Routing.update_server(args.input) do
      {:ok, %{message: "server updated"}}
    end
  end

  def delete_server(_, %{id: id}, _) do
    with {:ok, _} <- Routing.get_server!(id) |> Routing.delete_server() do
      {:ok, %{message: "server deleted"}}
    end
  end
end
