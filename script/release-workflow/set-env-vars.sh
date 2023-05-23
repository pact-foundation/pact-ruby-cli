#!/bin/sh

set -e

export DOCKER_IMAGE_ORG_AND_NAME=${DOCKER_IMAGE_ORG_AND_NAME:-'pact-foundation/pact-cli'}
if [ -n "${DOCKER_TARGET_PLATFORM:-}" ]; then
    export ARCH=$(echo "$DOCKER_TARGET_PLATFORM" | sed 's/linux\///' | sed 's/\/v.*//')
    export ARCHES="$ARCH"
    export $ARCHES
else 
    export ARCHES='amd64 arm64 arm'
    export ARCH=amd64
fi

if [ -z "$TAG" ]; then
  if [ -n "$VERSION" ] && [ -z "$INCREMENT" ]; then
    echo "If VERSION is specified, then INCREMENT must also be specified"
    exit 1
  fi

  export INCREMENT=${INCREMENT:-minor}

  if [ -z "$VERSION" ]; then
    export VERSION=$(bundle exec bump show-next $INCREMENT)
  fi

  export PACT_CLI_VERSION=$(ruby -I lib -e "require 'pact/cli/version.rb'; puts Pact::Cli::VERSION")
  export TAG="$VERSION-pactcli${PACT_CLI_VERSION}"
  export MAJOR_TAG="$(echo $VERSION | cut -d'.' -f1)"

  echo "INCREMENT=$INCREMENT"
  echo "VERSION=$VERSION"
  echo "PACT_CLI_VERSION=$PACT_CLI_VERSION"
  echo "TAG=$TAG"
  echo "MAJOR_TAG=$MAJOR_TAG"
else
  echo "TAG=$TAG"
fi