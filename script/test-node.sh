#!/bin/bash


echo building for ${NODE_VERSION}

docker build . -t pactfoundation/pact-cli:latest-node${NODE_VERSION} -f Dockerfile-node
docker run --rm pactfoundation/pact-cli:latest-node${NODE_VERSION} pact
docker run --rm pactfoundation/pact-cli:latest-node${NODE_VERSION} pact-broker --help
docker run --rm pactfoundation/pact-cli:latest-node${NODE_VERSION} pact-message --help
docker run --rm pactfoundation/pact-cli:latest-node${NODE_VERSION} pact-mock-service --help
docker run --rm pactfoundation/pact-cli:latest-node${NODE_VERSION} pact-plugin-cli --help
docker run --rm pactfoundation/pact-cli:latest-node${NODE_VERSION} pact-provider-verifier --help
docker run --rm pactfoundation/pact-cli:latest-node${NODE_VERSION} pact-stub-service --help
docker run --rm pactfoundation/pact-cli:latest-node${NODE_VERSION} pactflow --help