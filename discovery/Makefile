docker.build: docker.build.dev

docker.build.dev:
	docker build -f Dockerfile.dev -t discovery:latest .

docker.build.prod:
	docker build -f Dockerfile -t discovery:latest .

docker.down:
	docker-compose down

docker.entrypoint:
	mix deps.get && \
	mix ecto.setup && \
	elixir --sname discovery -S mix phx.server

docker.up:
	docker-compose up

console.iex:
	docker exec -it discovery iex --sname discovery_console --remsh discovery

console.psql:
	docker exec -it postgres psql -U postgres -d gondor_dev

console.sh:
	docker exec -it discovery sh

db.migrate:
	docker exec -it discovery mix ecto.migrate

db.reset:
	docker exec -it discovery mix ecto.reset

test:
	docker exec -it discovery mix test

test.format:
	mix format --check-formatted

test.lint:
	mix credo --config-file=.credo.exs list --all --strict --format=oneline

test.lint.edit:
	make test.lint | egrep "(lib|test|config|priv)/.+\.exs?" | awk "{print $$3}" | awk -F":" "{print $$1}" | vim -

test.typespecs:
	mix dialyzer --format dialyxir

test.all: test test.lint test.format

.PHONY: test
