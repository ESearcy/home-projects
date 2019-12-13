defmodule Discovery.Routing.Repositorys.ServerRepository do
  @moduledoc """
  The Routing context.
  """

  import Ecto.Query, warn: false
  alias Discovery.Repo

  alias Discovery.CommonQueries
  alias Discovery.Routing.Schemas.ServerSchema
  alias Discovery.Routing.Queries.ServerQueries

  @doc """
  Returns the list of servers.

  ## Examples

      iex> list_servers()
      [%Server{}, ...]

  """
  def list_servers do
    Repo.all(ServerSchema)
  end

  @doc """
  Gets a single server.

  Raises `Ecto.NoResultsError` if the Server does not exist.

  ## Examples

      iex> get_server!(123)
      %Server{}

      iex> get_server!(456)
      ** (Ecto.NoResultsError)

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
  Creates a server.

  ## Examples

      iex> create_server(%{field: value})
      {:ok, %Server{}}

      iex> create_server(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_server(attrs \\ %{}) do
    %ServerSchema{}
    |> ServerSchema.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a server.

  ## Examples

      iex> update_server(server, %{field: new_value})
      {:ok, %Server{}}

      iex> update_server(server, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_server(%ServerSchema{} = server, attrs) do
    server
    |> ServerSchema.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Server.

  ## Examples

      iex> delete_server(server)
      {:ok, %Server{}}

      iex> delete_server(server)
      {:error, %Ecto.Changeset{}}

  """
  def delete_server(%ServerSchema{} = server) do
    Repo.delete(server)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking server changes.

  ## Examples

      iex> change_server(server)
      %Ecto.Changeset{source: %Server{}}

  """
  def change_server(%ServerSchema{} = server) do
    ServerSchema.changeset(server, %{})
  end
end
