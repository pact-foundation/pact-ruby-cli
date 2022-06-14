# Pact CLI

This tool provides an amalgamated CLI of all the Pact CLI tools available in the Pact Ruby implementation (publish and verify pacts, and interact with the Pact Broker). While it is functionally the same as the [pact-ruby-standalone](https://github.com/pact-foundation/pact-ruby-standalone) it is packaged as a Docker container and a single top level entrypoint (`pact`).

## Usage

You can run the following examples against a public test Pact Broker with the following credentials:

```
export PACT_BROKER_BASE_URL="https://test.pactflow.io"
export PACT_BROKER_USERNAME="dXfltyFMgNOFZAxr8io9wJ37iUpY42M"
export PACT_BROKER_PASSWORD="O5AIZWxelWbLvqMd8PkAVycBJh2Psyg1"
```

The `$(date +%s)` in the examples is just to generate a pseudo random GIT_COMMIT.

All commands prefixed with pact-broker can be used with the OSS Pact Broker and Pactflow. Commands prefixed with pactflow can only be used with Pactflow.

Authentication using a bearer token can be specified using the environment variable `$PACT_BROKER_TOKEN` or the -k or --broker-token parameters. This bearer token authentication is used by Pactflow and is not available in the OSS Pact Broker, which only supports basic auth.

### Help

```
$ docker run --rm pactfoundation/pact-cli:latest help
Commands:
  pact-broker                     # Interact with a Pact Broker
  publish PACT_DIRS_OR_FILES ...  # Publish pacts to a Pact Broker.
  verify PACT_URL ...             # Verify pact(s) against a provider. S...
  version                         # Print the version
  help [COMMAND]                  # Describe available commands or one s...
  pactflow                        # Interact with Pactflow

$ docker run --rm pactfoundation/pact-cli:latest pact-broker help
Commands:
  pact-broker can-i-deploy -a, --pacticipant=PACTICIPANT -b, --broker-base-url=BRO...
  pact-broker create-version-tag -a, --pacticipant=PACTICIPANT -b, --broker-base-u...
  pact-broker create-webhook URL -X, --request=REQUEST -b, --broker-base-url=BROKE...
  pact-broker describe-version -a, --pacticipant=PACTICIPANT -b, --broker-base-url...
  pact-broker help [COMMAND]                                                      ...
  pact-broker publish PACT_DIRS_OR_FILES ... -a, --consumer-app-version=CONSUMER_A...
  pact-broker version                                                             ...
```

### Publish pacts

You can clone `git@github.com:pact-foundation/pact-ruby-cli.git` and run the following from the root directory.

```
docker run --rm \
 -w ${PWD} \
 -v ${PWD}:${PWD} \
 -e PACT_BROKER_BASE_URL \
 -e PACT_BROKER_USERNAME \
 -e PACT_BROKER_PASSWORD \
  pactfoundation/pact-cli:latest \
  publish \
  ${PWD}/example/pacts \
  --consumer-app-version fake-git-sha-for-demo-$(date +%s) \
  --tag-with-git-branch
```

See https://github.com/pact-foundation/pact_broker-client#publish for all publish options.

#### Demo only - publish an example pact from data baked into the docker image

```
docker run --rm  \
  -e PACT_BROKER_BASE_URL  \
  -e PACT_BROKER_USERNAME  \
  -e PACT_BROKER_PASSWORD  \
  pactfoundation/pact-cli:latest \
  publish \
  /pact/example/pacts \
  --consumer-app-version fake-git-sha-for-demo-$(date +%s)
```

### Verify pacts

See the example [docker-compose-verify.yml](https://github.com/pact-foundation/pact-ruby-cli/blob/master/docker-compose-verify.yml)

```
PACT_BROKER_PUBLISH_VERIFICATION_RESULTS=true GIT_COMMIT=fake-git-sha-for-demo$(date +%s) GIT_BRANCH=master \
  docker-compose -f docker-compose-verify.yml \
  up --build --abort-on-container-exit --exit-code-from pact_verifier
```

See https://github.com/pact-foundation/pact-provider-verifier/#usage for all verification options.

### Can I deploy?

```
docker run --rm \
 -e PACT_BROKER_BASE_URL \
 -e PACT_BROKER_USERNAME \
 -e PACT_BROKER_PASSWORD \
  pactfoundation/pact-cli:latest \
  pact-broker can-i-deploy \
  --pacticipant docker-example-consumer \
  --latest
```

See https://github.com/pact-foundation/pact_broker-client#can-i-deploy for all options.

### Tag a pacticipant version

```
docker run --rm \
 -e PACT_BROKER_BASE_URL \
 -e PACT_BROKER_USERNAME \
 -e PACT_BROKER_PASSWORD \
  pactfoundation/pact-cli:latest \
  pact-broker create-version-tag \
  --pacticipant docker-example-consumer \
  --version fake-git-sha-for-demo-$(date +%s) \
  --tag prod
```

See https://github.com/pact-foundation/pact_broker-client#create-version-tag for all options.

### Mock service

```
docker run -dit \
  --rm \
  --name pact-mock-service \
  -p 1234:1234 \
  -v ${HOST_PACT_DIRECTORY}:/tmp/pacts \
  pactfoundation/pact-cli:latest \
  mock-service \
  -p 1234 \
  --host 0.0.0.0 \
  --pact-dir /tmp/pacts
```

The `-it` is required if you want the container to respond to a `ctl+c`. The container takes an unexpectedly long time to shut down when using `docker stop`. This is an open issue.

See https://github.com/pact-foundation/pact-mock_service#mock-service-usage for all options.

### Publish Provider Contract

Publish provider contract to Pactflow

See the [docs](https://docs.pactflow.io/docs/bi-directional-contract-testing/contracts/oas#publishing-the-provider-contract--results-to-pactflow) for more info

```sh
Usage:
docker run --rm  -w /app \
 -v ${PWD}:/app \
      -e PACT_BROKER_BASE_URL \
      -e PACT_BROKER_TOKEN \
      pactfoundation/pact-cli:latest \
      pactflow publish-provider-contract CONTRACT_FILE \
          --broker-token=BROKER_TOKEN
          --broker-base-url=BROKER_BASE_URL
          --provider PROVIDER \
          --provider-app-version PROVIDER_APP_VERSION \
          --branch BRANCH \
          --content-type CONTENT_TYPE \
          --verification-exit-code=EXIT_CODE \
          --verification-results REPORT_PATH \
          --verification-results-content-type REPORT_CONTENT_TYPE \
          --verifier VERIFIER
```

#### Demo only - publish an example oas from data baked into the docker image

```sh
docker run --rm  \
  -e PACT_BROKER_BASE_URL  \
  -e PACT_BROKER_TOKEN \
  pactfoundation/pact-cli:latest \
  pactflow publish-provider-contract \
  /pact/example/provider-contracts/products_v1.0.0.yml \
  --provider "Example OAS Provider" \
  --provider-app-version fake-git-sha-for-demo-$(date +%s) \
  --branch "main" \
  --content-type application/yaml \
  --verification-success \
  --verification-results /pact/example/provider-contracts/verification-results.txt \
  --verification-results-content-type text/plain \
  --verifier "custom"
```

You can use the following examples

- They paths included below are for referencing in the Docker ClI tool for demo purposes, or in the GH [repo](https://github.com/pact-foundation/pact-ruby-cli/tree/master/example)

1. `/pact/example/provider-contracts/`products_v1.0.0.yml` - original canonical example - [https://docs.pactflow.io/oas/products](https://docs.pactflow.io/oas/products)
2. `/pact/example/provider-contracts/`products_v1.0.1.yml` - remove price
3. `/pact/example/provider-contracts/`products_v1.0.2.yml` - remove name
4. `/pact/example/provider-contracts/`products_v1.0.3.yml` - rename path /product to /products
5. `/pact/example/provider-contracts/`products_v1.0.4.yml` - support /product and /products
6. `/pact/example/provider-contracts/`products_v1.0.5.yml` - remove /product

along with the following consumer contracts.

These rely on the provider being named `pactflow_bdc_demo_provider`

1. `/pact/example/consumer-contracts/pact_bdc_v1.0.0.json` - original canonical example [https://github.com/pactflow/example-consumer](https://github.com/pactflow/example-consumer/blob/master/src/api.pact.spec.js)
2. `/pact/example/consumer-contracts/pact_bdc_v1.0.1.json` - adds price expectation in response payloads
3. `/pact/example/consumer-contracts/pact_bdc_v1.0.2.json` - add new field expectation visibility
4. `/pact/example/consumer-contracts/pact_bdc_v1.0.3.json` - updates to call new endpoint `/products`

### Using a custom certificate

```
docker run --rm \
 -v <PATH_TO_CERT_FILE_ON_HOST>:/tmp/cacert.pem \
 -e SSL_CERT_FILE=/tmp/cacert.pem \
 pactfoundation/pact-cli:latest ...
```

You can also set `SSL_CERT_DIR` and mount the directory instead of the file.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pact-foundation/pact-ruby-cli.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
