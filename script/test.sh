#!/bin/bash -e

docker build . -t pactfoundation/pact-cli
docker run --rm pactfoundation/pact-cli:latest
docker run --rm pactfoundation/pact-cli:latest help
docker run --rm pactfoundation/pact-cli:latest mock-service --help
docker run --rm pactfoundation/pact-cli:latest pact-broker --help
docker run --rm pactfoundation/pact-cli:latest pactflow --help
docker run --rm pactfoundation/pact-cli:latest publish --help
docker run --rm pactfoundation/pact-cli:latest stub-service --help
docker run --rm pactfoundation/pact-cli:latest verify --help
