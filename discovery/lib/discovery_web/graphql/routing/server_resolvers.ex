defmodule DiscoveryWeb.Graphql.Routing.ServerResolvers do
  alias Discovery.Routing.ServerContext

  def servers(_, _, _) do
    {:ok, ServerContext.list_servers()}
  end

  def server(_, %{id: id}, _) do
    {:ok, ServerContext.get_server!(id)}
  end

  def create_server(_, args, _) do
    with {:ok, _} <- ServerContext.create_server(args.input) |> IO.inspect() do
      {:ok, %{message: "server info saved"}}
    end
  end

  def update_server(_, args, _) do
    with {:ok, server} <-
           ServerContext.get_server!(args.input.id) |> ServerContext.update_server(args.input) do
      {:ok, %{message: "server info updated"}}
    end
  end

  def delete_server(_, %{id: id}, _) do
    with {:ok, _} <- ServerContext.get_server!(id) |> ServerContext.delete_server() do
      {:ok, %{message: "server info deleted"}}
    end
  end
end
