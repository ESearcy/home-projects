defmodule Node.Pisystem.Logics.DockerLogic do
  alias Node.Common

  def list_docker_containers_pagination(filter, pagination) do
    containers = get_docker()

    filtered_containers = Common.filter_inclusive_or(containers, filter)
    paginated_containers = Common.paginate_response(filtered_containers, pagination)
    {:ok, paginated_containers}
  end

  def get_docker_container_by_id(id) do
    containers = get_docker()
    filtered_containers = Common.filter_inclusive_or(containers, %{id: [id]})
    (length(filtered_containers) == 1) |> IO.inspect()

    case length(filtered_containers) == 1 do
      true -> {:ok, List.first(filtered_containers)}
      false -> {:error, "cound not find containers with id: #{id}"}
    end
  end

  def get_docker() do
    {details, number} =
      System.cmd("docker", [
        "ps",
        "--format",
        "{{.ID}},{{.Names}},{{.Status}},{{.Ports}},{{.Image}}"
      ])

    lines = String.split(details, "\n")
    list = Enum.map(lines, fn x -> split_line_into_column(x) end)

    list = Enum.filter(list, &(!is_nil(&1)))
    list
  end

  def split_line_into_column(line) do
    linearray = String.split(line, ",")

    id = Enum.at(linearray, 0)
    names = Enum.at(linearray, 1)
    status = Enum.at(linearray, 2)
    ports = Enum.at(linearray, 3)
    image = Enum.at(linearray, 4)

    if !is_nil(id) && !is_nil(names) && !is_nil(status) && !is_nil(ports) && !is_nil(image) do
      %{id: id, names: names, status: status, ports: ports, image: image}
    else
      nil
    end
  end
end
