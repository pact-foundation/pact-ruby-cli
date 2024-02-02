#!/bin/sh

set -euo >/dev/null

push() {
  docker buildx build --platform=linux/amd64,linux/arm64,linux/arm \
    --output=type=image,push=true \
    -t ${DOCKER_IMAGE_ORG_AND_NAME}:$1 .
  docker buildx build --platform=linux/amd64,linux/arm64,linux/arm \
  --output=type=image,push=true \
  -t ghcr.io/${DOCKER_IMAGE_ORG_AND_NAME}:$1 .
}

if [ -n "${MAJOR_TAG:-}" ]; then
  push ${MAJOR_TAG}
fi

push ${TAG}

if [ "${PUSH_TO_LATEST}" != "false" ]; then
  push latest
fi