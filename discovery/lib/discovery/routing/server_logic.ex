defmodule Discovery.Routing.Logics.ServerLogic do
  alias Discovery.Routing.Repositories.ServerRepository

  def process_server_ping(attrs) do
    # see if server exists
    case ServerRepository.get_server_by_serial(attrs.serial_number) do
      {:ok, server} -> update_server(server, attrs)
      {:error, _} -> create_server(attrs)
    end
  end

  def list_servers_pagination(filter, pagination) do
    ServerRepository.list_servers_pagination(filter, pagination)
  end

  defp update_server(server, attrs) do
    with {:ok, _} <- ServerRepository.update_server(server, attrs) do
      {:ok, Map.merge(%{message: "server info updated"}, server)}
    end
  end

  def get_server_by_serial(serial_number) do
    ServerRepository.get_server_by_serial(serial_number)
  end

  defp create_server(attrs) do
    with {:ok, server} <- ServerRepository.create_server(attrs) do
      {:ok, Map.merge(%{message: "server added to system"}, server)}
    end
  end

  # make method for weekly cleanup & status updates
end
