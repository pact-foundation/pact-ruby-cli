#!/bin/bash

docker build . -t pactfoundation/pact-cli
docker run --rm pactfoundation/pact-cli:latest
