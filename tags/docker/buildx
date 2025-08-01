# Build-X usage:

Docker Build-X is a CLI plugin that extends the functionality of Docker CLI to facilitate building and pushing multi-architecture images.

## Installation:
Refer `kh docker install` for installation.

## Install Build-X from binary:
**1. Create required directory to place the plugin:**
   mkdir -p $HOME/.docker/cli-plugins

**2. Download BuildX plugin:**
   wget --no-verbose --show-progress \
        --quiet --progress=bar:force:noscroll \
        --output-document=$HOME/.docker/cli-plugins/docker-buildx \
          https://github.com/docker/buildx/releases/download/v0.10.4/buildx-v0.10.4.linux-amd64 && \

**3. Make it as executable:**
   chmod +x $HOME/.docker/cli-plugins/docker-buildx

## Create a builder:
docker buildx create --use

This creates a new builder named "default" and sets it as the active builder.
The `--use` flag indicates that the newly created builder should be immediately set as the active builder.
Try `docker buildx create --help` for more info.

## Inspect a builder:
docker buildx inspect <builder-name>

## List available builders:
docker buildx ls

### Build a multi-platform image:
docker buildx build --platform linux/amd64,linux/arm64 -t IMAGE:TAG .

## Use a custom builder configuration file:
docker buildx create --use mybuilder --config mybuilder-config.json

## Build and push a multi-platform image:
docker buildx build --platform linux/amd64,linux/arm64 -t your-image:latest --push .

## Set the default builder:
docker buildx use mybuilder

## Remove a builder:
docker buildx rm mybuilder

## Remove Build-X
sudo apt remove docker-buildx-plugin
