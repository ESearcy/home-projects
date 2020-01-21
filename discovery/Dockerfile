FROM elixir:1.9-alpine

ENV APP_HOME /app
WORKDIR $APP_HOME
COPY . .

RUN scripts/docker/build-common.sh

CMD ["mix", "ecto.setup", "phx.server"]
