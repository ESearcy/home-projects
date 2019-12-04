defmodule HomeCluster.RoutingTest do
  use HomeCluster.DataCase

  alias HomeCluster.Routing

  describe "servers" do
    alias HomeCluster.Routing.Server

    @valid_attrs %{local_ip: "some local_ip", memory_max: 42, memory_used: 42, name: "some name", public_ip: "some public_ip", type: "some type"}
    @update_attrs %{local_ip: "some updated local_ip", memory_max: 43, memory_used: 43, name: "some updated name", public_ip: "some updated public_ip", type: "some updated type"}
    @invalid_attrs %{local_ip: nil, memory_max: nil, memory_used: nil, name: nil, public_ip: nil, type: nil}

    def server_fixture(attrs \\ %{}) do
      {:ok, server} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Routing.create_server()

      server
    end

    test "list_servers/0 returns all servers" do
      server = server_fixture()
      assert Routing.list_servers() == [server]
    end

    test "get_server!/1 returns the server with given id" do
      server = server_fixture()
      assert Routing.get_server!(server.id) == server
    end

    test "create_server/1 with valid data creates a server" do
      assert {:ok, %Server{} = server} = Routing.create_server(@valid_attrs)
      assert server.local_ip == "some local_ip"
      assert server.memory_max == 42
      assert server.memory_used == 42
      assert server.name == "some name"
      assert server.public_ip == "some public_ip"
      assert server.type == "some type"
    end

    test "create_server/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Routing.create_server(@invalid_attrs)
    end

    test "update_server/2 with valid data updates the server" do
      server = server_fixture()
      assert {:ok, %Server{} = server} = Routing.update_server(server, @update_attrs)
      assert server.local_ip == "some updated local_ip"
      assert server.memory_max == 43
      assert server.memory_used == 43
      assert server.name == "some updated name"
      assert server.public_ip == "some updated public_ip"
      assert server.type == "some updated type"
    end

    test "update_server/2 with invalid data returns error changeset" do
      server = server_fixture()
      assert {:error, %Ecto.Changeset{}} = Routing.update_server(server, @invalid_attrs)
      assert server == Routing.get_server!(server.id)
    end

    test "delete_server/1 deletes the server" do
      server = server_fixture()
      assert {:ok, %Server{}} = Routing.delete_server(server)
      assert_raise Ecto.NoResultsError, fn -> Routing.get_server!(server.id) end
    end

    test "change_server/1 returns a server changeset" do
      server = server_fixture()
      assert %Ecto.Changeset{} = Routing.change_server(server)
    end
  end
end
