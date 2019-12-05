defmodule DiscoveryWeb.Graphql.Middleware.RequireAuthentication do
  @moduledoc """
  Requires that an authenticated user is available in resolution's context map
  """

  alias Absinthe.Resolution

  @behaviour Absinthe.Middleware

  @type config_t :: term

  @spec call(Resolution.t(), config_t) :: Resolution.t()
  def call(%{context: %{user: user}} = resolution, _config) when is_map(user) do
    resolution
  end

  def call(resolution, _config) do
    Resolution.put_result(resolution, {:error, "User not authenticated"})
  end
end
