defmodule Discovery.Repo.Migrations.CreateServers do
  use Ecto.Migration

  def change do
    create table(:servers) do
      add(:alias, :string)
      add(:type, :string)
      add(:local_ip, :string)
      add(:public_ip, :string)
      add(:memory_max, :float)
      add(:memory_available, :float)
      add(:containers_available, :integer)
      add(:containers_max, :integer)
      add(:temp, :float)

      timestamps()
    end
  end
end
