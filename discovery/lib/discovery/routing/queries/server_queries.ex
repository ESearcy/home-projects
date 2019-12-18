defmodule Discovery.Routing.Queries.ServerQueries do
  @moduledoc """
  Composable Ecto queries for organizations.
  """
  import Ecto.Query, warn: false
  alias Discovery.Routing.Schemas.ServerSchema
  @spec server :: Ecto.Query.t()
  def server do
    from(ServerSchema, as: :server)
  end

  @spec order_by_timestamp(Ecto.Query.t()) :: Ecto.Query.t()
  def order_by_timestamp(query) do
    order_by(
      query,
      [server: server],
      server.updated_at
    )
  end

  @spec filter(Ecto.Query.t(), map) :: Ecto.Query.t()
  def filter(query, params) do
    Enum.reduce(params, query, fn {key, value}, query ->
      filter(query, key, value)
    end)
  end

  @spec filter(Ecto.Query.t(), atom(), any()) :: Ecto.Query.t()
  def filter(query, _, nil) do
    query
  end

  def filter(query, :id, value) do
    where(
      query,
      [server: server],
      server.id == ^value
    )
  end

  def filter(query, :serial_number, value) do
    where(
      query,
      [server: server],
      server.serial_number == ^value
    )
  end

  def filter(query, :type, value) do
    where(
      query,
      [server: server],
      ilike(server.type, ^"%#{value}%")
    )
  end
end
