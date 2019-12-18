defmodule Discovery.Routing.Schemas.ServerSchema do
  use Ecto.Schema
  import Ecto.Changeset

  schema "servers" do
    field(:alias, :string)
    field(:containers_available, :integer)
    field(:containers_max, :integer)
    field(:local_ip, :string)
    field(:memory_available, :float)
    field(:memory_max, :float)
    field(:public_ip, :string)
    field(:temp, :float)
    field(:type, :string)
    field(:serial_number, :string)

    timestamps()
  end

  @doc false
  def changeset(server, attrs) do
    server
    |> cast(attrs, [
      :alias,
      :type,
      :local_ip,
      :public_ip,
      :memory_max,
      :memory_available,
      :containers_available,
      :containers_max,
      :temp,
      :serial_number
    ])

    # |> validate_required([
    #  :alias,
    #  :type,
    #  :local_ip,
    #  :public_ip,
    #  :memory_max,
    #  :memory_available,
    #  :containers_available,
    #  :containers_max,
    #  :temp
    # ])
  end
end
