#! /usr/bin/env bash

docker run --rm --detach \
    --name dev-postgres \
    --env POSTGRES_USER=root \
    --env POSTGRES_PASSWORD=password \
    --env PGDATA=/var/lib/postgresql/data/pgdata \
    --volume dev-db-volume:/var/lib/postgresql/data \
    --publish 5432:5432 \
    postgres:latest
