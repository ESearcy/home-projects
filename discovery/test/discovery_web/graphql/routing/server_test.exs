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

# # add Permission#
# describe "Test Permissions" do
#   @tag :cbu
#   test "query" do
#     result =
#       Absinthe.run(
#         """
#         mutation($input: CentralBankPermissionInput!) {
#         createPermisssion(input: $input) {
#         message
#         }
#         }
#         """,
#         @schema,
#         variables: %{
#           "input" => %{
#             "permission" => "Test-Permission"
#           }
#         }
#       )

#     assert {:ok,
#             %{
#               data: %{
#                 "createPermisssion" => %{
#                   "message" => "Permission saved."
#                 }
#               }
#             }} == result
#   end

#   @tag :cbu
#   test "delete permission" do
#     {:ok, permission} =
#       CentralBankContext.CentralBankPermission.create_central_bank_permission(%{
#         permission: "Test-Permission"
#       })

#     result =
#       Absinthe.run(
#         """
#         mutation{
#         deletePermission(id: #{permission.id}) {
#         message
#         }
#         }
#         """,
#         @schema
#       )

#     assert {:ok,
#             %{
#               data: %{
#                 "deletePermission" => %{
#                   "message" => "Permission deleted."
#                 }
#               }
#             }} == result
#   end

#   test "list permissions" do
#     CentralBankContext.CentralBankPermission.create_central_bank_permission(%{
#       permission: "Test-permission"
#     })

#     CentralBankContext.CentralBankPermission.create_central_bank_permission(%{
#       permission: "Test-permission2"
#     })

#     CentralBankContext.CentralBankPermission.create_central_bank_permission(%{
#       permission: "Test-permission3"
#     })

#     CentralBankContext.CentralBankPermission.create_central_bank_permission(%{
#       permission: "Test-permission4"
#     })

#     result =
#       Absinthe.run(
#         """
#         {
#         permissions(pagination: {pageSize: 1, page: 1}){
#         list {
#         id
#         permission
#         }
#         pagination {
#         page
#         pageSize
#         pages
#         total
#         }
#         }
#         }
#         """,
#         @schema
#       )

#     assert {:ok,
#             %{
#               data: %{
#                 "permissions" => [
#                   %{
#                     "list" => [%{"id" => _, "permission" => "Test-permission"}],
#                     "pagination" => %{"page" => 1, "pageSize" => 1, "pages" => 4, "total" => 4}
#                   }
#                 ]
#               }
#             }} = result
#   end
# end
