#!/bin/bash

DOCKER_IMAGE_ORG_AND_NAME=${DOCKER_IMAGE_ORG_AND_NAME:-"you54f/pact-cli"}
TAG=${TAG:-"latest"}

docker build . -t ${DOCKER_IMAGE_ORG_AND_NAME}:${TAG}
docker run --rm ${DOCKER_IMAGE_ORG_AND_NAME}:${TAG}
docker run --rm ${DOCKER_IMAGE_ORG_AND_NAME}:${TAG} version
docker run --rm ${DOCKER_IMAGE_ORG_AND_NAME}:${TAG} help
docker run --rm ${DOCKER_IMAGE_ORG_AND_NAME}:${TAG} mock-service --help
docker run --rm ${DOCKER_IMAGE_ORG_AND_NAME}:${TAG} pact-broker --help
docker run --rm ${DOCKER_IMAGE_ORG_AND_NAME}:${TAG} pactflow --help
docker run --rm ${DOCKER_IMAGE_ORG_AND_NAME}:${TAG} publish --help
docker run --rm ${DOCKER_IMAGE_ORG_AND_NAME}:${TAG} stub-service --help
docker run --rm ${DOCKER_IMAGE_ORG_AND_NAME}:${TAG} verify --help