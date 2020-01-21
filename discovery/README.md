# Discovery

Directory Structure:

lib folders

to run project run:
docker-compose build
docker-compose up

Launch just this project, no postgres. 

in swarm as a service:
single app - wont work without postgres
docker image build -t discovery:1.0 .
docker service create --name discovery-server discovery:1.0
docker service ps discovery-server
docker service logs discovery-server
docker service rm discovery-server

--as a deployment
docker container run --publish 4000:4000 --detach --name discovery-server discovery:1.0
docker container rm --force discovery-server

as swarm:
docker stack deploy -c docker-compose.yml discovery-server
docker stack ls
docker service logs -f discovery-server
docker stack rm discovery-server
