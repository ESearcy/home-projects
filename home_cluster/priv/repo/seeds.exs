# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     HomeCluster.Repo.insert!(%HomeCluster.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias HomeCluster.Repo
alias HomeCluster.Routing.Server

%Server{
    name: "dev1",
    type: "unset",
    memory_used: 10,
    memory_max: 64,
    local_ip: "127.0.0.1",
    public_ip: "194.3.2.11"
} |> Repo.insert!

%Server{
    name: "dev2",
    type: "db",
    memory_used: 30,
    memory_max: 128,
    local_ip: "127.0.0.2",
    public_ip: "194.3.2.12"
} |> Repo.insert!

%Server{
    name: "dev3",
    type: "app",
    memory_used: 20,
    memory_max: 64,
    local_ip: "127.0.0.3",
    public_ip: "194.3.2.13"
} |> Repo.insert!
    
%Server{
    name: "dev4",
    type: "master",
    memory_used: 30,
    memory_max: 64,
    local_ip: "127.0.0.4",
    public_ip: "194.3.2.14"
} |> Repo.insert!