# Pact CLI

This tool provides an amalgamated CLI of all the Pact CLI tools available in the Pact Ruby implementation (publish and verify pacts, and interact with the Pact Broker). While it is functionally the same as the [pact-ruby-standalone](https://github.com/pact-foundation/pact-ruby-standalone) it is packaged as a Docker container and a single top level entrypoint (`pact`).

[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://GitHub.com/pact-foundation/pact-msw-adapter/graphs/commit-activity)

[![Build and test](https://github.com/pact-foundation/pact-ruby-cli/actions/workflows/test.yml/badge.svg)](https://github.com/pact-foundation/pact-ruby-cli/actions/workflows/test.yml)
[![Audit](https://github.com/pact-foundation/pact-ruby-cli/actions/workflows/audit.yml/badge.svg)](https://github.com/pact-foundation/pact-ruby-cli/actions/workflows/audit.yml)
[![Release](https://github.com/pact-foundation/pact-ruby-cli/actions/workflows/release_image.yml/badge.svg)](https://github.com/pact-foundation/pact-ruby-cli/actions/workflows/release_image.yml)

[![pulls](https://badgen.net/docker/pulls/pactfoundation/pact-cli?icon=docker&label=pulls)](https://hub.docker.com/r/pactfoundation/pact-cli)
[![stars](https://badgen.net/docker/stars/pactfoundation/pact-cli?icon=docker&label=stars)](https://hub.docker.com/r/pactfoundation/pact-cli)

[![size: amd64](https://badgen.net/docker/size/pactfoundation/pact-cli/latest/amd64?icon=docker&label=size%3Aamd64)](https://hub.docker.com/r/pactfoundation/pact-cli)
[![size: arm64](https://badgen.net/docker/size/pactfoundation/pact-cli/latest/arm64?icon=docker&label=size%3Aarm64)](https://hub.docker.com/r/pactfoundation/pact-cli)
[![size: arm](https://badgen.net/docker/size/pactfoundation/pact-cli/latest/arm?icon=docker&label=size%3Aarm)](https://hub.docker.com/r/pactfoundation/pact-cli)

## Platforms

Multi-platform images are available, and can be used cross-platform by setting the `platform` flag.

- `--platform=linux/amd64` 
- `--platform=linux/arm` 
- `--platform=linux/arm64` 

  ```sh
  docker run --rm it pactfoundation/pact-cli:latest /bin/sh -c 'uname -sm'
  ```

## Usage

You can run the following examples against a public test Pact Broker with the following credentials:

```
export PACT_BROKER_BASE_URL="https://test.pactflow.io"
export PACT_BROKER_USERNAME="dXfltyFMgNOFZAxr8io9wJ37iUpY42M"
export PACT_BROKER_PASSWORD="O5AIZWxelWbLvqMd8PkAVycBJh2Psyg1"
```

The `$(date +%s)` in the examples is just to generate a pseudo random GIT_COMMIT.

If you are using a Pact Broker with bearer token authentication (eg. PactFlow), then set `PACT_BROKER_TOKEN` instead of the username and password.

### Docker gotchas

* If you are publishing pacts, don't forget to mount your pacts into the docker container using the `-v` flag, documented in the example below.
* If you are connecting to a Pact Broker that you are running on `localhost`, you will need to add `--network="host"` to the docker command so that it resolves `localhost` to your machine, rather than to the container itself.

### Help

```
$ docker run --rm pactfoundation/pact-cli:latest help
Commands:
  pact-broker                     # Interact with a Pact Broker
  publish PACT_DIRS_OR_FILES ...  # Publish pacts to a Pact Broker.
  verify PACT_URL ...             # Verify pact(s) against a provider. S...
  version                         # Print the version
  help [COMMAND]                  # Describe available commands or one s...

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

You can clone `git@github.com:pact-foundation/pact-ruby-cli.git` (https://github.com/pact-foundation/pact-ruby-cli) and run the following from the root directory.

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

### Pactflow AI

The Pactflow AI tool is included in the image for convenience, for more commands refer to the [documentation](https://docs.pactflow.io/docs/ai/) and find example usage below:-

```
docker run --rm \
pactfoundation/pact-cli:latest \
--mount type=volume,source=<volume-name>,target=<mount-path-in-container> \
-e PACT_BROKER_BASE_URL="https://YOUR_ORG.pactflow.io" \ 
-e PACT_BROKER_TOKEN="YOUR_TOKEN" \
pactflow-ai --help
```

demo only

```
docker run --rm  \
 pactfoundation/pact-cli:latest \
 --mount type=volume,source=<volume-name>,target=<mount-path-in-container> \
  -e PACT_BROKER_BASE_URL="https://YOUR_ORG.pactflow.io" \ 
  -e PACT_BROKER_TOKEN="YOUR_TOKEN" \
  pactflow-ai \
  generate \
  --openapi /example/provider-contracts/oas.yml \
  --endpoint "/admin/teams/{uuid}" \
  --output src/api.pact.spec.ts \
  --language typescript
```



### Using a custom certificate

```
docker run --rm \
 -v <PATH_TO_CERT_FILE_ON_HOST>:/tmp/cacert.pem \
 -e SSL_CERT_FILE=/tmp/cacert.pem \
 pactfoundation/pact-cli:latest ...
```

You can also set `SSL_CERT_DIR` and mount the directory instead of the file.

---

To connect to a Pact Broker that uses **x509 certificates** for client authentication:

```
docker run --rm \
 -v <PATH_TO_CLIENT_CERT_FILE_ON_HOST>:/tmp/clientcert.pem \
 -v <PATH_TO_CLIENT_KEY_FILE_ON_HOST>:/tmp/clientkey.pem \
 -e X509_CLIENT_CERT_FILE=/tmp/clientcert.pem \
 -e X509_CLIENT_KEY_FILE=/tmp/clientkey.pem \
 pactfoundation/pact-cli:latest ...
```

### Shell access inside Docker container

To meet with [Docker consistency rules](https://github.com/docker-library/official-images#consistency) `sh` access is provided, _NOTE:_ `bash` is not installed in the container

```
$ docker run --rm pactfoundation/pact-cli sh -c 'ls'
Gemfile
Gemfile.lock
bin
entrypoint.sh
example
lib
pact-cli.gemspec
```

```
$ docker run --rm pactfoundation/pact-cli ls
Gemfile
Gemfile.lock
bin
entrypoint.sh
example
lib
pact-cli.gemspec
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pact-foundation/pact-ruby-cli.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
