#!/usr/bin/env sh

# This file is to be run in the docker image and utilized to build commonality between
# the different environments we intend to build images for (e.g. local dev and production).

erl -v
elixir -v

apk add make
apk add build-base

mix local.hex --force
mix local.rebar --force
mix hex.info
mix deps.get

ls -la
