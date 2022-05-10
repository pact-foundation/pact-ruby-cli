#!/bin/sh

docker run --rm \
 -w ${PWD} \
 -v ${PWD}:${PWD} \
 -e PACT_BROKER_BASE_URL \
 -e PACT_BROKER_USERNAME \
 -e PACT_BROKER_PASSWORD \
 -e PACT_BROKER_TOKEN \
 -e PACTFLOW_FEATURES=publish-provider-contract \
  pactfoundation/pact-cli:latest \
  pactflow publish-provider-contract \
  ${PWD}/example/provider-contracts/oas.yml \
  --provider "Example OAS Provider" \
  --provider-app-version fake-git-sha-for-demo-$(date +%s) \
  --branch "main" \
  --content-type application/yaml \
  --verification-success \
  --verification-results ${PWD}/example/provider-contracts/verification-results.txt \
  --verification-results-content-type text/plain \
  --verifier "custom"
