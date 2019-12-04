defmodule HomeCluster.Repo do
  use Ecto.Repo,
    otp_app: :home_cluster,
    adapter: Ecto.Adapters.Postgres
end
