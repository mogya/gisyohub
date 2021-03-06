#!/bin/bash 
# gisyohub deploy script.

set -e

cd $(dirname $0)
. ./.envrc

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

# need to reload in case of ruby upgrade.
export RUBY_VERSION=`cat rails/.ruby-version`

docker-compose build
docker-compose up -d
