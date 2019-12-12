defmodule Discovery.Routing.ServerLogic do
  alias Discovery.Routing.ServerRepository

  def update_server(args) do
    with {:ok, server} <-
           ServerRepository.get_server(args.input.id),
         {ok, _} <- ServerRepository.update_server(server, args.input) do
      {:ok, Map.merge(%{message: "server info updated"}, server)}
    end
  end

  def list_servers() do
    {:ok, ServerRepository.list_servers()}
  end

  def list_servers_pagination(filter \\ {}, pagination \\ {}) do
    ServerRepository.list_servers_pagination(filter, pagination)
  end

  def get_server(id) do
    ServerRepository.get_server(id)
  end

  def create_server(args) do
    with {:ok, server} <- ServerRepository.create_server(args.input) do
      {:ok, Map.merge(%{message: "server info saved"}, server)}
    end
  end

  def delete_server(id) do
    with {:ok, server} <- ServerRepository.get_server(id),
         {:ok, _} <- ServerRepository.delete_server(server) do
      {:ok, %{message: "server info deleted"}}
    end
  end
end
