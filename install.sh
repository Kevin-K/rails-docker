#!/bin/bash

if [ $# -ne 1 ]; then
    echo $0:
    echo "1 argument expected: directory to create & install into"
    echo "example: $0 git/my_app"
    exit 1
fi

sys_dep_check() {
    git version > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        echo "Unable to check git. Ensure git is installed"
        exit 3
    fi
    docker info > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        echo "Unable to check docker. Ensure docker is installed and daemon is running"
        exit 3
    fi

    docker-compose version > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        echo "Unable to check docker-compose. Ensure docker-compose is installed"
        exit 3
    fi
}

repo_pull() {
    git clone --depth=1 --branch=v0.1.0-preview https://github.com/Kevin-K/rails-docker-init.git $1
    cd $1
    rm -rf .git README.md install.sh && git init .
    touch rails_docker_setup.log
}

create_rails() {
    docker-compose run --no-deps web rails new . --force --database=postgresql > rails_docker_setup.log
}

# Linux/Windows users need to set ownership of the files
# due to a docker behavior.
linux_permissions() {
    if type "chown" > /dev/null; then
        echo "Setting file permissions..."
        sudo -u chown -R $USER:$USER .
    fi
}

rails_deps() {
    docker-compose build > rails_docker_setup.log
}

overrides() {
    yes | cp -rf overrides/* .
    rm -rf overrides
}

echo "System dependency check..."
sys_dep_check

echo "Base repo cloning..."
repo_pull $1

echo "Creating Rails app..."
create_rails
linux_permissions

echo "Installing dependencies..."
rails_deps

echo "Copying overrides..."
overrides

echo "Complete!"
echo ""
echo "From within your new app, run the following to start your rails application:"
echo -e "\tdocker-compose up"
echo ""
