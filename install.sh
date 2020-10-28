#!/bin/bash

if [ $# -ne 1 ]; then
    echo $0:
    echo "1 argument expected: directory to create & install into"
    echo "example: $0 git/my_app"
    exit 1
fi

git clone --depth=1 --branch=main git@github.com:Kevin-K/rails-docker-init.git $1
cd $1
rm -rf .git README.md install.sh && git init .
docker-compose build
docker-compose run --no-deps web rails new . --force --database=postgresql