# Rails on Docker
A base setup to kickstart a rails app with  postgres through docker.
See the docker docs for coverage on how this is crafted: https://docs.docker.com/compose/rails/.

## Setup
Run the following
```
docker-compose run --no-deps web rails new . --force --database=postgresql
```