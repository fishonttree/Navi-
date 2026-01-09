#!/bin/bash

docker compose up -d

DB_NAME="navi_db"
POSTGRES_USER="postgres"
POSTGRES_PASSWORD="postgres"

export PGPASSWORD=$POSTGRES_PASSWORD

psql -h localhost -p 5432 -U $POSTGRES_USER -d $DB_NAME <<EOF
drop table if exists flyway_schema_history;
drop table if exists locations;
drop table if exists events;
drop table if exists trips;
drop table if exists users;
EOF

unset PGPASSWORD

docker compose down
docker compose up -d