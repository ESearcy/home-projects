defmodule ProxyWeb.PageController do
  use ProxyWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
