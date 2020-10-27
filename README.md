# Rails Docker Init

A base setup to kickstart a rails app with postgres through docker.
The app is not created already, rather this is a ready-to-go set of files to install a new rails app with docker
See the docker docs for coverage on how this is crafted: https://docs.docker.com/compose/rails/.

## Setup

Run the following to create a new "app":

```
git clone --depth=1 --branch=main git@github.com:Kevin-K/rails-docker-init.git app
cd app
rm -rf .git README.md && git init .
docker-compose run --no-deps web rails new . --force --database=postgresql
```

With that you've pulled down this base setup, and ran the initialization process for a rails app with postgres!

### Version Info

- Postgres: 13
- Ruby: 2.7
- Rails: 6
