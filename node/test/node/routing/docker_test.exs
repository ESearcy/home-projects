defmodule Node.DockerTest do
  use Node.DataCase

  alias Node.Pisystem.Logics.DockerLogic

  describe "Docker Testing" do
    # @test_docker_image_alias "mongo:latest"
    # @img1_name = test-container-1:latest
    # @img2_name = test-container-2:latest
    # @img3_name = test-container-3:latest

    # docker friendly test environment only - need test env
    test "get_docker_container_by_id" do
      # DockerLogic.get_docker_container_by_id("id_123acb")
      # Start container, save id
      # query for container with id of ...
      # ensure id matches
      # ensure not null
      # shut down container
      # assert @mocked_server_response == result
    end

    # docker friendly test environment only - need test env
    test "get_docker_container_by_name" do
      # DockerLogic.get_docker_container_by_id("id_123acb")
      # Start container with test name
      # query for container with name of ...
      # ensure name matches
      # ensure not null
      # shut down container
      # assert @mocked_server_response == result
    end

    # docker friendly test environment only - need test env
    test "list_docker_containers_pagination & multipule shutdown" do
      # DockerLogic.list_docker_containers_pagination(%{names: "search-name"}, %{
      #   page: 1,
      #   pageSize: 1
      # })
      # query for number of current images
      # start up 3 images
      # list with page size of 2, double check total is previous total +3
      # shutdown test related images
      # query & compare the number of images again
    end

    # docker friendly test environment only - need test env
    test "start & stop docker container" do
      # start single container take id
      # stop a docker container using the above id
      # todo
    end

    # docker friendly test environment only - need test env
    test "killall && cleanall docker containers" do
      # start single container take id
      # stop a docker container using the above id
      # todo
    end
  end
end
