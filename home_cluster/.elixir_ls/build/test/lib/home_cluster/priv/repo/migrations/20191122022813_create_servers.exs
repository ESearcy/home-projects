defmodule HomeCluster.Repo.Migrations.CreateServers do
  use Ecto.Migration

  def change do
    create table(:servers) do
      add :name, :string
      add :type, :string
      add :memory_used, :integer
      add :memory_max, :integer
      add :local_ip, :string
      add :public_ip, :string

      timestamps()
    end

  end
end
