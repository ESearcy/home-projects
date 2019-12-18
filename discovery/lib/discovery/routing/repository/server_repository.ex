defmodule Discovery.Routing.Repositories.ServerRepository do
  @moduledoc """
  The Routing context.
  """

  import Ecto.Query, warn: false
  alias Discovery.Repo

  alias Discovery.CommonQueries
  alias Discovery.Routing.Schemas.ServerSchema
  alias Discovery.Routing.Queries.ServerQueries

  @doc """
  Returns the list of servers. (shouldn't really be used very much)
  """
  def list_servers do
    Repo.all(ServerSchema)
  end

  @doc """
    Returns the list of servers with pagination info
  """
  def list_servers_pagination(filter \\ %{}, pagination \\ %{}) do
    ServerQueries.server()
    |> ServerQueries.filter(filter)
    |> ServerQueries.order_by_timestamp()
    |> CommonQueries.result_list(pagination)
  end

  @doc """
  Gets a single server.
  """
  def get_server(id) do
    ServerQueries.server()
    |> ServerQueries.filter(:id, id)
    |> CommonQueries.result_one()
  end

  @doc """
  Gets a single server.
  """
  def get_server_by_serial(serial_number) do
    ServerQueries.server()
    |> ServerQueries.filter(:serial_number, serial_number)
    |> CommonQueries.result_one()
  end

  @doc """
  Creates a server.
  """
  def create_server(attrs \\ %{}) do
    %ServerSchema{}
    |> ServerSchema.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a server.
  """
  def update_server(%ServerSchema{} = server, attrs) do
    server
    |> ServerSchema.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Server.
  """
  def delete_server(%ServerSchema{} = server) do
    Repo.delete(server)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking server changes.
  """
  def change_server(%ServerSchema{} = server) do
    ServerSchema.changeset(server, %{})
  end
end
