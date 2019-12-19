defmodule Node.Pisystem.Logics.DockerLogic do
  def list_picontainers_pagination(filter, pagination) do
    {:ok, get_docker()}
  end

  def get_picontainer_by_id(id) do
    {:ok, mock_pi_container()}
  end

  def mock_pi_container do
    %{
      id: "mocked-123acb",
      image: "mocked-postgres",
      status: "running",
      ports: "5432:5432,tcp",
      names: "postgresql-mock"
    }
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
    # do pagination stuff, fix magic numbers
    %{list: list, pagination: %{total: length(list), page: 1, page_size: 10, pages: 1}}
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
