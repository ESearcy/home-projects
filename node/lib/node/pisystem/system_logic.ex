defmodule Node.Pisystem.Logics.SystemLogic do
  def get_system_info do
    {details, number} =
      System.cmd("docker", [
        "ps",
        "--format",
        "{{.ID}},{{.Names}},{{.Status}},{{.Ports}},{{.Image}}"
      ])

    lines = String.split(details, "\n")
    list = Enum.map(lines, fn x -> split_line_on_space(x) end)
    # do pagination stuff
    %{list: list, pagination: %{total: 0, page: 1, page_size: 10, pages: 1}}
    # result |> IO.inspect()
    # System.schedulers() |> IO.inspect()
  end

  def split_line_on_space(line) do
    linearray = String.split(line, ",")

    id = Enum.at(linearray, 0)
    names = Enum.at(linearray, 1)
    status = Enum.at(linearray, 2)
    ports = Enum.at(linearray, 3)
    image = Enum.at(linearray, 4)

    %{id: id, names: names, status: status, ports: ports, image: image}
  end
end
