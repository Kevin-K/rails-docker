# Rails Docker Init

A base setup to kickstart a rails app with postgres through docker.
The app is not created already, rather this is a ready-to-go set of files to install a new rails app with docker.
See the docker docs for coverage on how this is crafted: https://docs.docker.com/compose/rails/.

## Setup

Run the following to create a new "app":

```bash
curl https://raw.githubusercontent.com/kevin-k/rails-docker-init/v0.1.0-preview/install.sh | bash -s <install location>
```

With that you've pulled down this base setup, and ran the initialization process for a rails app with postgres!

Bring your app online with:

```bash
cd <install location>
docker-compose up
```

## Why?

There are plenty of ready-to-go base rails app repos with docker images out there, but as time goes on images
become outdated. This tool is for those who want a bare docker rails installation, in a point-and-click manner.

This installer self-destructs, you are left with your own app in a new repo once complete.

## Version Info

- Postgres: 13
- Ruby: 2.7
- Rails: 6


## Contribution Requests
Always looking for collaborators! Current list of feature requests:
1. **Configurable database installation strategy.** 
   1. Add argument-driven support to install.sh for mysql.
   2. Add argument-driven support to install.sh for sqlite3.
2. Configurable webpacker framework selection. 
   1. Add argument-driven support for selecting a framework for webpacker (react, vue, angular, elm, stimulus)
3. **Configurable cache installation strategy.** 
   1. Add argument-driven support to install.sh for including redis (add redis in compose & gem installation/config). [see docs](https://guides.rubyonrails.org/caching_with_rails.html#activesupport-cache-rediscachestore).