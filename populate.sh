#!/usr/bin/env bash

echo "Populating street-coin database in local.."
docker exec --env-file='./.env' -i db bash -c 'mongodump --archive="./tmp/dump-streetcoin.gz" --gzip --db streetcoin --uri "$DB_URL" && mongorestore --gzip --nsInclude="streetcoin.*" --archive="./tmp/dump-streetcoin.gz"'