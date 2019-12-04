defmodule Discovery.RoutingTest do
  use Discovery.DataCase

  alias Discovery.Routing

  describe "servers" do
    alias Discovery.Routing.Server

    @valid_attrs %{alias: "some alias", containers_available: 42, containers_max: 42, local_ip: "some local_ip", memory_available: "some memory_available", memory_max: "some memory_max", public_ip: "some public_ip", temp: 42, type: "some type"}
    @update_attrs %{alias: "some updated alias", containers_available: 43, containers_max: 43, local_ip: "some updated local_ip", memory_available: "some updated memory_available", memory_max: "some updated memory_max", public_ip: "some updated public_ip", temp: 43, type: "some updated type"}
    @invalid_attrs %{alias: nil, containers_available: nil, containers_max: nil, local_ip: nil, memory_available: nil, memory_max: nil, public_ip: nil, temp: nil, type: nil}

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
      assert server.alias == "some alias"
      assert server.containers_available == 42
      assert server.containers_max == 42
      assert server.local_ip == "some local_ip"
      assert server.memory_available == "some memory_available"
      assert server.memory_max == "some memory_max"
      assert server.public_ip == "some public_ip"
      assert server.temp == 42
      assert server.type == "some type"
    end

    test "create_server/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Routing.create_server(@invalid_attrs)
    end

    test "update_server/2 with valid data updates the server" do
      server = server_fixture()
      assert {:ok, %Server{} = server} = Routing.update_server(server, @update_attrs)
      assert server.alias == "some updated alias"
      assert server.containers_available == 43
      assert server.containers_max == 43
      assert server.local_ip == "some updated local_ip"
      assert server.memory_available == "some updated memory_available"
      assert server.memory_max == "some updated memory_max"
      assert server.public_ip == "some updated public_ip"
      assert server.temp == 43
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
