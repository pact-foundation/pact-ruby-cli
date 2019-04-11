#!/bin/bash

docker build . -t pact
docker run --rm pact:latest
