#!/bin/bash

set -eu

SCRIPT_DIR=$(cd "$(dirname $0)"/.. && pwd)

for arch in amd64; do 
    docker run --rm \
      -v ${PWD}/script/scan-inside-docker-container.sh:/pact/scan-inside-docker-container.sh \
      -u root \
      --entrypoint /bin/sh \
      "${DOCKER_IMAGE_ORG_AND_NAME}:latest-${arch}" \
      /pact/scan-inside-docker-container.sh
done