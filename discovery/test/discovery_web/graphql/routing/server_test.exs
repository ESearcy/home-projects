defmodule DiscoveryWeb.Graphql.ServerTests do
  @moduledoc false

  use Discovery.DataCase, async: true

  alias Discovery.Routing.ServerSchema
  @schema DiscoveryWeb.Graphql.Schema.MasterSchema
  # add Permission & duplicate Permission Test#
  describe "Duplicate Permissions" do
    @tag cbu: true
    test "mutation" do
      # ServerSchema.create_server(%{
      #   alias: "some alias",
      #   containers_available: 42,
      #   containers_max: 42,
      #   local_ip: "some local_ip",
      #   memory_available: 5,
      #   memory_max: 5,
      #   public_ip: "some public_ip",
      #   temp: 42,
      #   type: "some type"
      # })

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
  end
end
