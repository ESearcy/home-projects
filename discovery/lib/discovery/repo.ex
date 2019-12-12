defmodule Discovery.Repo do
  use Ecto.Repo,
    otp_app: :discovery,
    adapter: Ecto.Adapters.Postgres

  use Scrivener
end
