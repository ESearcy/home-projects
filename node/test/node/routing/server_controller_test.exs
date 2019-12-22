defmodule Node.PisystemLogicTest do
  use Node.DataCase

  alias Node.Pisystem.Logics.DockerLogic

  describe "Picontainer Logic Controller Testing" do
    @create_attribs %{
      serial_number: "12345",
      alias: "logic_test_ping_create",
      containers_available: 1,
      containers_max: 4,
      local_ip: "195.21.6.5",
      memory_available: 4,
      memory_max: 4,
      message: "picontainer added to system",
      public_ip: "128.0.0.5",
      temp: 37,
      type: "none"
    }
    @mocked_server_response {:ok,
                             %{
                               command: "mocked-startpoint.sh",
                               created: "mocked 1 day ago",
                               id: "mocked-123acb",
                               names: "postgresql-mock",
                               ports: "5432:5432,tcp",
                               status: "running"
                             }}
    @mocked_paginated_response {:ok,
                                %{
                                  list: [
                                    %{
                                      command: "mocked-startpoint.sh",
                                      created: "mocked 1 day ago",
                                      id: "mocked-123acb",
                                      names: "postgresql-mock",
                                      ports: "5432:5432,tcp",
                                      status: "running"
                                    },
                                    %{
                                      command: "mocked-startpoint.sh",
                                      created: "mocked 1 day ago",
                                      id: "mocked-123acb",
                                      names: "postgresql-mock",
                                      ports: "5432:5432,tcp",
                                      status: "running"
                                    },
                                    %{
                                      command: "mocked-startpoint.sh",
                                      created: "mocked 1 day ago",
                                      id: "mocked-123acb",
                                      names: "postgresql-mock",
                                      ports: "5432:5432,tcp",
                                      status: "running"
                                    }
                                  ],
                                  pagination: %{page: 1, page_size: 10, pages: 1, total: 0}
                                }}

    test "get_picontainer_by_id" do
      result = DockerLogic.get_picontainer_by_id("id_123acb")

      # assert @mocked_server_response == result
    end

    test "list_picontainers_pagination" do
      result =
        DockerLogic.list_picontainers_pagination(%{names: "search-name"}, %{
          page: 1,
          pageSize: 10
        })

      # assert @mocked_paginated_response = result
    end
  end
end
