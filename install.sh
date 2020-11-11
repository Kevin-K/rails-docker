#!/bin/bash

if [ $# -ne 1 ]; then
    echo $0:
    echo "1 argument expected: directory to create & install into"
    echo "example: $0 git/my_app"
    exit 1
fi

git clone --depth=1 --branch=v0.1.0-preview https://github.com/Kevin-K/rails-docker-init.git $1
cd $1
rm -rf .git README.md install.sh && git init .
touch rails_docker_setup.log

echo "Creating Rails app..."
docker-compose run --no-deps web rails new . --force --database=postgresql > rails_docker_setup.log

# Linux/Windows users need to set ownership of the files
# due to a docker behavior.
if type "chown" > /dev/null; then
    echo "Setting file permissions..."
    sudo chown -R $USER:$USER .
fi
echo "Installing dependencies..."
docker-compose build > rails_docker_setup.log

echo "Copying overrides..."
yes | cp -rf overrides/* .
rm -rf overrides

echo "Complete!"
echo ""
echo "From within your new app, run the following to start your rails application:"
echo -e "\tdocker-compose up"
echo ""
