defmodule Discovery.RoutingLogicTest do
  use Discovery.DataCase

  alias Discovery.Routing.Logics.ServerLogic

  describe "Server Logic Controller Testing" do
    @create_attribs %{
      serial_number: "12345",
      alias: "logic_test_ping_create",
      containers_available: 1,
      containers_max: 4,
      local_ip: "195.21.6.5",
      memory_available: 4,
      memory_max: 4,
      message: "server added to system",
      public_ip: "128.0.0.5",
      temp: 37,
      type: "none"
    }

    test "ping & create" do
      case ServerLogic.process_server_ping(@create_attribs) do
        {:ok, _} -> assert true
        {:error, _} -> assert false
      end
    end

    test "create & retrieve" do
      ServerLogic.process_server_ping(@create_attribs)

      case ServerLogic.get_server_by_serial("12345") do
        {:ok, _} -> assert true
        {:error, _} -> assert false
      end
    end
  end
end
