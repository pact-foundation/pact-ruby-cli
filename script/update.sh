#!/bin/sh

set -e
rm -rf tmp/Gemfile.lock
DOCKER_DEFAULT_PLATFORM=linux/amd64
docker build . -f Dockerfile-bundle-base -t pact_cli_bundle_base >/dev/null 2>&1
docker run -it --rm -v ${PWD}/tmp:/tmp/gemfiles pact_cli_bundle_base:latest sh -c "bundle update && cp Gemfile.lock /tmp/gemfiles/Gemfile.lock"
mv tmp/Gemfile.lock .


# TODO
# if ! git diff-index --quiet HEAD Gemfile.lock; then
#   commit_message=$(git diff Gemfile.lock | grep + | grep pact | sed -e "s/+ *//" | ruby -e 'puts ARGF.read.split("\n").join(", ")')
# fi
