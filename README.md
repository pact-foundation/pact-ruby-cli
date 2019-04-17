# Pact CLI

This tool provides an amalgamated CLI of all the Pact CLI tools available in the Pact Ruby implementation (publish and verify pacts, and interact with the Pact Broker). While it is functionally the same as the [pact-ruby-standalone](https://github.com/pact-foundation/pact-ruby-standalone) it provides a Docker container and a single top level entrypoint (`pact`).

## Usage

You can run the following examples against a public test Pact Broker with the following credentials:

```
export PACT_BROKER_BASE_URL="https://test.pact.dius.com.au"
export PACT_BROKER_USERNAME="dXfltyFMgNOFZAxr8io9wJ37iUpY42M"
export PACT_BROKER_PASSWORD="O5AIZWxelWbLvqMd8PkAVycBJh2Psyg1"
```

### Help

```
$ docker run --rm pactfoundation/pact-cli:latest help
Commands:
  broker                          # Interact with a Pact Broker
  publish PACT_DIRS_OR_FILES ...  # Publish pacts to a Pact Broker.
  verify PACT_URL ...             # Verify pact(s) against a provider. S...
  version                         # Print the version
  help [COMMAND]                  # Describe available commands or one s...

$ docker run --rm pactfoundation/pact-cli:latest broker help
Commands:
  broker can-i-deploy -a, --pacticipant=PACTICIPANT -b, --broker-base-url=BRO...
  broker create-version-tag -a, --pacticipant=PACTICIPANT -b, --broker-base-u...
  broker create-webhook URL -X, --request=REQUEST -b, --broker-base-url=BROKE...
  broker describe-version -a, --pacticipant=PACTICIPANT -b, --broker-base-url...
  broker help [COMMAND]                                                      ...
  broker publish PACT_DIRS_OR_FILES ... -a, --consumer-app-version=CONSUMER_A...
  broker version                                                             ...
```

### Publish an example pact with data baked in to the docker image

```
docker run --rm  \
  -e PACT_BROKER_BASE_URL  \
  -e PACT_BROKER_USERNAME  \
  -e PACT_BROKER_PASSWORD  \
  pactfoundation/pact-cli:latest \
  publish \
  /pact/example/pacts \
  --consumer-app-version 1844a123a89e113cff14cee80f1fc6$(date +%s)
```

### Publish pacts from host machine

You can clone git@github.com:pact-foundation/pact-ruby-cli.git and run the following from the root directory.

```
docker run --rm \
 -v ${PWD}:${PWD} \
 -e PACT_BROKER_BASE_URL \
 -e PACT_BROKER_USERNAME \
 -e PACT_BROKER_PASSWORD \
  pactfoundation/pact-cli:latest \
  publish \
  ${PWD}/example/pacts \
  --consumer-app-version 1844a123a89e113cff14cee80f1fc6d$(date +%s)
```

### Can I deploy?

```
docker run --rm \
 -e PACT_BROKER_BASE_URL \
 -e PACT_BROKER_USERNAME \
 -e PACT_BROKER_PASSWORD \
  pactfoundation/pact-cli:latest \
  broker can-i-deploy \
  --pacticipant Foo \
  --latest
```

### Mock service

If you want to use the Pact Mock Service in Docker, you should use https://cloud.docker.com/u/pactfoundation/repository/docker/pactfoundation/pact-mock-service as it requires ports to be mounted exposed correctly in the Dockerfile.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pact-foundation/pact-cli.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
