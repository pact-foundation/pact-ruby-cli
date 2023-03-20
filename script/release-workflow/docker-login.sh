#!/bin/sh

set -euo >/dev/null

if [ -n "${DOCKER_HUB_USERNAME:-}" ]; then
  echo ${DOCKER_HUB_TOKEN} | docker login --username ${DOCKER_HUB_USERNAME} --password-stdin
else
  echo "Cannot log into dockerhub because DOCKER_HUB_USERNAME is not set"
fi
