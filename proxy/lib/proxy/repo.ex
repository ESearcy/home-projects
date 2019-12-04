defmodule Proxy.Repo do
  use Ecto.Repo,
    otp_app: :proxy,
    adapter: Ecto.Adapters.Postgres
end
