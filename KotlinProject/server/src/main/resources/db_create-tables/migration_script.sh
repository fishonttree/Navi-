#!/bin/bash

docker compose up -d

DB_NAME="navi_db"
POSTGRES_USER="postgres"
POSTGRES_PASSWORD="postgres"

docker exec -i navi_postgres psql -U $POSTGRES_USER -d $DB_NAME <<EOF
drop table if exists flyway_schema_history;
drop table if exists locations;
drop table if exists events;
drop table if exists trips;
drop table if exists users;
EOF

docker compose down
docker compose up -d