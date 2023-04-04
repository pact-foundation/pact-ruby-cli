#!/bin/sh

set -euo >/dev/null

# docker buildx build --platform=linux/amd64,linux/arm64,linux/arm \
#     --output=type=image \ 
#     -t ${DOCKER_IMAGE_ORG_AND_NAME}:latest .

## This will allow for local use for testing or scanning with trivy (multi-manifest builds cannot be imported)
## we will build a multi-manifest build during ./docker-push.sh

# for arch in amd64 arm64 arm; do 
for arch in amd64; do 
    docker buildx build \
    --platform linux/$arch \
    --output type=docker \
    --tag ${DOCKER_IMAGE_ORG_AND_NAME}:latest-${arch} \
    .
done