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

# front container build front contents.
# It put a file:dist/buildend at the end of build task.
docker-compose build front
docker-compose up front
if [ ! -f front/dist/buildend ]; then
  echo "fail to build front contents."
  exit 1
fi

# now we can build nginx container with front contents.
docker-compose build

docker-compose up -d
