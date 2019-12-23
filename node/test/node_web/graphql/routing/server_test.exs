# defmodule NodeWeb.Graphql.PicontainerTests do
#   @moduledoc false

#   use Node.DataCase, async: true

#   @schema NodeWeb.Graphql.Schema.MasterSchema
#   # add Permission & duplicate Permission Test#
#   describe "Duplicate Permissions" do
#     @tag cbu: true

#     test "mutation" do
#       result =
#         Absinthe.run(
#           """
#           mutation($input: PicontainerCreate!) {
#           pingPicontainer(input: $input) {
#           message
#           }
#           }
#           """,
#           @schema,
#           variables: %{
#             "input" => %{
#               "alias" => "some alias",
#               "local_ip" => "some local_ip",
#               "public_ip" => "some public_ip",
#               "temp" => 42,
#               "type" => "some type",
#               "serial_number" => "001122334455abc"
#             }
#           }
#         )

#       assert {:ok,
#               %{
#                 data: %{
#                   "pingPicontainer" => %{"message" => "docker_container added to system"}
#                 }
#               }} == result

#       result2 =
#         Absinthe.run(
#           """
#           mutation($input: PicontainerCreate!) {
#           pingPicontainer(input: $input) {
#           message
#           }
#           }
#           """,
#           @schema,
#           variables: %{
#             "input" => %{
#               "alias" => "some alias",
#               "local_ip" => "some local_ip",
#               "public_ip" => "some public_ip",
#               "temp" => 42,
#               "type" => "some updated type",
#               "serial_number" => "001122334455abc"
#             }
#           }
#         )

#       assert {:ok,
#               %{
#                 data: %{
#                   "pingPicontainer" => %{"message" => "docker_container info updated"}
#                 }
#               }} == result2
#     end

#     test "retrieve docker_container" do
#       {:ok, result} =
#         Absinthe.run(
#           """
#           mutation($input: PicontainerCreate!) {
#           pingPicontainer(input: $input) {
#           message
#           id
#           serial_number
#           inserted_at
#           }
#           }
#           """,
#           @schema,
#           variables: %{
#             "input" => %{
#               "alias" => "some alias",
#               "local_ip" => "some local_ip",
#               "public_ip" => "some public_ip",
#               "temp" => 42,
#               "type" => "some type",
#               "serial_number" => "001122334455abc"
#             }
#           }
#         )

#       serial_number = result.data |> Map.get("pingPicontainer") |> Map.get("serial_number")
#       inserted_at = result.data |> Map.get("pingPicontainer") |> Map.get("inserted_at")

#       query_result =
#         Absinthe.run(
#           """
#           {
#           docker_container(serial_number: "#{serial_number}") {
#           inserted_at
#           serial_number
#           }
#           }
#           """,
#           @schema
#         )

#       expected_result =
#         {:ok,
#          %{
#            data: %{
#              "docker_container" => %{
#                "serial_number" => "#{serial_number}",
#                "inserted_at" => "#{inserted_at}"
#              }
#            }
#          }}

#       assert expected_result == query_result
#     end

#     test "retrieve paginated list of currency orders" do
#       # ensure there is a record in the table#

#       my_type = "some type"

#       Absinthe.run(
#         """
#         mutation($input: PicontainerCreate!) {
#         pingPicontainer(input: $input) {
#         message
#         }
#         }
#         """,
#         @schema,
#         variables: %{
#           "input" => %{
#             "alias" => "some alias",
#             "local_ip" => "some local_ip",
#             "public_ip" => "some public_ip",
#             "temp" => 42,
#             "type" => my_type,
#             "serial_number" => "001122334455abc-first"
#           }
#         }
#       )

#       Absinthe.run(
#         """
#         mutation($input: PicontainerCreate!) {
#         pingPicontainer(input: $input) {
#         message
#         }
#         }
#         """,
#         @schema,
#         variables: %{
#           "input" => %{
#             "alias" => "some alias",
#             "local_ip" => "some local_ip",
#             "public_ip" => "some public_ip",
#             "temp" => 42,
#             "type" => my_type,
#             "serial_number" => "001122334455abc-second"
#           }
#         }
#       )

#       {:ok, result} =
#         Absinthe.run(
#           """
#           query{
#           docker_containers(pagination: {pageSize: 5, page: 1}, filter: {type: "#{my_type}"}){
#           list{
#           type
#           }
#           pagination {
#           page
#           pageSize
#           pages
#           total
#           }
#           }
#           }
#           """,
#           @schema
#         )

#       orders = Map.get(result.data, "docker_containers")
#       list = orders |> Map.get("list")
#       assert length(list) > 0

#       Enum.each(list, fn order ->
#         type = order |> Map.get("type")
#         assert type == my_type
#       end)
#     end
#   end
# end
