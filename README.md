# Rails Docker Init

A base setup to kickstart a rails app with postgres through docker.
The app is not created already, rather this is a ready-to-go set of files to install a new rails app with docker
See the docker docs for coverage on how this is crafted: https://docs.docker.com/compose/rails/.

## Setup

Run the following to create a new "app":

```bash
curl https://raw.githubusercontent.com/kevin-k/rails-docker-init/v0.1.0-preview/install.sh | bash -s <install location>
```

##### Example

Install new app at ~/git/my_app (directory created by install)

```bash
curl https://raw.githubusercontent.com/kevin-k/rails-docker-init/v0.1.0-preview/install.sh | bash -s ~/git/my_app
```

With that you've pulled down this base setup, and ran the initialization process for a rails app with postgres!

Bring your app online with:

```bash
docker-compose build # first run to install deps
docker-compose up
```

### Why?

There are plenty of ready to go base rails app repos with docker images out there. The goal of this tool is to
have a single-run script to generate a fresh rails app leveraging docker & docker-compose. Run one script and
have a rails app & compose setup ready to go.

This installer self-destructs, you are left with your own app in a new repo once complete.

##### Linux User?

With volume mounting, files will be owned by `root` by default. I'm working through the best approach to this currently.
Rails file generation is a commonly used feature, and since this setup leverages docker-compose's volume mounting the
current requirement is to run `sudo chown -R $USER:$USER .` to update permissions on new files.

### Version Info

- Postgres: 13
- Ruby: 2.7
- Rails: 6
