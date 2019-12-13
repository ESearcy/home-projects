defmodule DiscoveryWeb.Graphql.ServerTests do
  @moduledoc false

  use Discovery.DataCase, async: true

  alias Discovery.Routing.Schemas.ServerSchema
  @schema DiscoveryWeb.Graphql.Schema.MasterSchema
  # add Permission & duplicate Permission Test#
  describe "Duplicate Permissions" do
    @tag cbu: true

    test "mutation" do
      result =
        Absinthe.run(
          """
          mutation($input: ServerCreate!) {
          createServer(input: $input) {
          message
          }
          }
          """,
          @schema,
          variables: %{
            "input" => %{
              "alias" => "some alias",
              "local_ip" => "some local_ip",
              "public_ip" => "some public_ip",
              "temp" => 42,
              "type" => "some type"
            }
          }
        )

      assert {:ok,
              %{
                data: %{
                  "createServer" => %{
                    "message" => "server info saved"
                  }
                }
              }} == result
    end

    test "retrieve server" do
      {:ok, result} =
        Absinthe.run(
          """
          mutation ($input: ServerCreate!) {
          createServer(input: $input) {
          message
          id
          inserted_at
          }
          }
          """,
          @schema,
          variables: %{
            "input" => %{
              "alias" => "test_create"
            }
          },
          context: %{user: %{}}
        )

      id = result.data |> Map.get("createServer") |> Map.get("id")
      inserted_at = result.data |> Map.get("createServer") |> Map.get("inserted_at")

      query_result =
        Absinthe.run(
          """
          {
          server(id: #{id}) {
          id
          inserted_at
          }
          }
          """,
          @schema,
          context: %{user: %{}}
        )

      expected_result =
        {:ok, %{data: %{"server" => %{"id" => "#{id}", "inserted_at" => "#{inserted_at}"}}}}

      assert expected_result == query_result
    end

    test "retrieve paginated list of currency orders" do
      my_type = "app"
      # ensure there is a record in the table#
      {:ok, _result} =
        Absinthe.run(
          """
          mutation ($input: ServerCreate!) {
          createServer(input: $input) {
          message
          id
          }
          }
          """,
          @schema,
          variables: %{
            "input" => %{
              "type" => my_type
            }
          },
          context: %{user: %{}}
        )

      {:ok, _result} =
        Absinthe.run(
          """
          mutation ($input: ServerCreate!) {
          createServer(input: $input) {
          message
          id
          }
          }
          """,
          @schema,
          variables: %{
            "input" => %{
              "type" => "do not find this id please...."
            }
          },
          context: %{user: %{}}
        )

      {:ok, result} =
        Absinthe.run(
          """
          query{
          servers(pagination: {pageSize: 5, page: 1}, filter: {type: "#{my_type}"}){
          list{
          type
          }
          pagination {
          page
          pageSize
          pages
          total
          }
          }
          }
          """,
          @schema,
          context: %{user: %{}}
        )

      orders = Map.get(result.data, "servers")
      list = orders |> Map.get("list")
      assert length(list) > 0

      Enum.each(list, fn order ->
        type = order |> Map.get("type")
        assert type == my_type
      end)
    end
  end
end
