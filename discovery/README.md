# Discovery

Directory Structure:

lib folders

to run project w/postgres run:
docker-compose build
docker-compose up

Launch just this project, no postgres. 

build image push to dockerhub
docker image build -t discovery:latest .
docker image tag discovery:latest esaucy/discovery:latest
docker image push esaucy/discovery:latest 


in swarm as a service:
single app - wont work without postgres
docker service create --name discovery-server discovery:latest
docker service ps discovery-server
docker service logs discovery-server
docker service rm discovery-server

--as a deployment
docker container run --publish 4000:4000 --detach --name discovery-server discovery:latest
docker container rm --force discovery-server

as swarm:
docker stack deploy -c docker-compose.yml discovery-app
docker stack ls
docker stack services discovery-app
docker service logs -f discovery-app
docker stack rm discovery-app


Developer Setup:
Install Elixir & erlang 1.10

run:
mix deps.get