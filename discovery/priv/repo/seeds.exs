alias Discovery.Repo
alias Discovery.Routing.ServerSchema

%ServerSchema{
  alias: "seed",
  type: "mock",
  local_ip: "0.0.0.0",
  public_ip: "127.0.0.0",
  memory_max: 4.0,
  memory_available: 2.0,
  containers_available: 1,
  containers_max: 2,
  temp: 22.0
}
|> Repo.insert!()
