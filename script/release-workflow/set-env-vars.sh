#!/bin/sh

set -e

export DOCKER_IMAGE_ORG_AND_NAME=${DOCKER_IMAGE_ORG_AND_NAME:-'pactfoundation/pact-cli'}
if [ -n "${DOCKER_TARGET_PLATFORM:-}" ]; then
    export ARCH=$(echo "$DOCKER_TARGET_PLATFORM" | sed 's/linux\///' | sed 's/\/v.*//')
    export ARCHES="$ARCH"
    export $ARCHES
else 
    export ARCHES='amd64 arm64'
    export ARCH=amd64
fi

if [ -n "${CUSTOM_TAG:-}" ]; then
  export TAG=$CUSTOM_TAG
  export MAJOR_TAG=""
else
  export TAG=$(script/release-workflow/next-docker-tag.sh)
  export MAJOR_TAG=$(echo $TAG | cut -d'.' -f1)
fi

echo "Set TAG=${TAG}"
echo "Set MAJOR_TAG=${MAJOR_TAG}"
