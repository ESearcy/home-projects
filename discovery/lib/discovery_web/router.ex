defmodule DiscoveryWeb.Router do
  use DiscoveryWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", DiscoveryWeb do
    pipe_through :api
  end
end
