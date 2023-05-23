#!/bin/bash

set -eu

ARCH=${ARCH:-'amd64'}
docker run --rm \
  --platform=linux/${ARCH} \
  -v ${PWD}/script/scan-inside-docker-container.sh:/pact/scan-inside-docker-container.sh \
  -u root \
  --entrypoint /bin/sh \
  "${DOCKER_IMAGE_ORG_AND_NAME}:latest-${ARCH}" \
  /pact/scan-inside-docker-container.sh
