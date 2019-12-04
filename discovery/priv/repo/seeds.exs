# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Discovery.Repo.insert!(%Discovery.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias:string type:string local_ip:string public_ip:string memory_max:float memory_available:float containers_available:integer containers_max:integer temp:float

alias Discovery.Repo
alias Discovery.Routing.Server

%Server{
  name: "Sand Castle",
  location: "Portugal",
  max_guests: 2

  alias: "seed",
  type: "mock",
  local_ip: "0.0.0.0",
  public_ip: "127.0.0.0",
  memory_max: "4",
  memory_available: "2",
  containers_available: 1,
  containers_max: 2,
  temp: 22
}
|> Repo.insert!()
