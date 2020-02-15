#!/bin/bash 
# gisyohub deploy script.

set -e

cd $(dirname $0)
. ./.envrc

# We do not use git pull to avoid trouble.
# in case you want to update server contents directly, use these commands.
# git checkout origin/master
# git pull
git fetch --all
git checkout --force origin/master

docker-compose build
docker-compose up -d
