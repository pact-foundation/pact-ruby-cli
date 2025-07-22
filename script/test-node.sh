#!/bin/bash -e


echo building for ${NODE_VERSION}

docker build . -t pactfoundation/pact-cli:latest-node${NODE_VERSION} -f Dockerfile-node
docker run --rm pactfoundation/pact-cli:latest-node${NODE_VERSION} help
docker run --rm pactfoundation/pact-cli:latest-node${NODE_VERSION} mock-service --help
docker run --rm pactfoundation/pact-cli:latest-node${NODE_VERSION} pact-broker --help
docker run --rm pactfoundation/pact-cli:latest-node${NODE_VERSION} pactflow --help
docker run --rm pactfoundation/pact-cli:latest-node${NODE_VERSION} publish --help
docker run --rm pactfoundation/pact-cli:latest-node${NODE_VERSION} stub-service --help
docker run --rm pactfoundation/pact-cli:latest-node${NODE_VERSION} verify --help