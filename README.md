# Pact CLI

This tool provides an amalgamated CLI for all the Pact CLI tools available in the Pact Ruby implementation (publish and verify pacts, and interact with the Pact Broker), and packages them in a Docker container.

## Usage

```
$ docker run --rm pactfoundation/pact-cli:latest help
Commands:
  broker                          # Interact with a Pact Broker
  help [COMMAND]                  # Describe available commands or one s...
  publish PACT_DIRS_OR_FILES ...  # Publish pacts to a Pact Broker.
  verify PACT_URL ...             # Verify pact(s) against a provider. S...
  version                         # Print the version
```

eg.

```
export PACT_BROKER_BASE_URL="https://test.pact.dius.com.au"
export PACT_BROKER_USERNAME="dXfltyFMgNOFZAxr8io9wJ37iUpY42M"
export PACT_BROKER_PASSWORD="O5AIZWxelWbLvqMd8PkAVycBJh2Psyg1"

docker run --rm \
 -e PACT_BROKER_BASE_URL \
 -e PACT_BROKER_USERNAME \
 -e PACT_BROKER_PASSWORD \
  pactfoundation/pact-cli:latest \
  broker can-i-deploy \
  --pacticipant Foo \
  --latest
```

If you want to use the Pact Mock Service in Docker, you should use https://cloud.docker.com/u/pactfoundation/repository/docker/pactfoundation/pact-mock-service as it requires ports to be mounted exposed correctly in the Dockerfile.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pact-foundation/pact-cli.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
