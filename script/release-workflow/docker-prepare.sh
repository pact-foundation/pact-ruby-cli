#!/bin/sh

set -euo >/dev/null

docker buildx create --platform linux/arm64,linux/arm/v8,linux/amd64 --name multi_arch_builder
docker buildx use multi_arch_builder