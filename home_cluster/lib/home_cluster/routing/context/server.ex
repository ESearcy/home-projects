defmodule HomeCluster.Routing.Server do
  use Ecto.Schema
  import Ecto.Changeset

  schema "servers" do
    field :local_ip, :string
    field :memory_max, :integer
    field :memory_used, :integer
    field :name, :string
    field :public_ip, :string
    field :type, :string

    timestamps()
  end

  @doc false
  def changeset(server, attrs) do
    server
    |> cast(attrs, [:name, :type, :memory_used, :memory_max, :local_ip, :public_ip])
    |> validate_required([:name, :type, :memory_used, :memory_max, :local_ip, :public_ip])
  end
end
