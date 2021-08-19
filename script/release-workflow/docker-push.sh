#!/bin/sh

set -euo >/dev/null

# Enable when we bump the major version to 1 (which we should)
# if [ -n "${MAJOR_TAG}" ]; then
#   docker tag ${DOCKER_IMAGE_ORG_AND_NAME}:latest ${DOCKER_IMAGE_ORG_AND_NAME}:${MAJOR_TAG}
#   docker push ${DOCKER_IMAGE_ORG_AND_NAME}:${MAJOR_TAG}
#   docker push ${DOCKER_IMAGE_ORG_AND_NAME}:latest
# fi

docker tag ${DOCKER_IMAGE_ORG_AND_NAME}:latest ${DOCKER_IMAGE_ORG_AND_NAME}:${TAG}
docker push ${DOCKER_IMAGE_ORG_AND_NAME}:${TAG}
