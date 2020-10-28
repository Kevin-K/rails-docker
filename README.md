# Rails Docker Init

A base setup to kickstart a rails app with postgres through docker.
The app is not created already, rather this is a ready-to-go set of files to install a new rails app with docker
See the docker docs for coverage on how this is crafted: https://docs.docker.com/compose/rails/.

## Setup

Run the following to create a new "app":

```bash
curl https://raw.githubusercontent.com/kevin-k/rails-docker-init/setup/install.sh | bash -s <install location>
```

##### Example

Install new app at ~/git/my_app (directory created by install)
```bash
curl https://raw.githubusercontent.com/kevin-k/rails-docker-init/setup/install.sh | bash -s ~/git/my_app
```

With that you've pulled down this base setup, and ran the initialization process for a rails app with postgres!

### Version Info

- Postgres: 13
- Ruby: 2.7
- Rails: 6
