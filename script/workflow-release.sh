#!/bin/sh

set -e

bundle exec rake package:update

if git log -1 | grep "feat(gems)"; then
  bundle exec bump ${1:-minor} --no-commit
  RELEASE=${RELEASE:-0}
  bundle exec rake generate_changelog
  git add lib/pact/cli/version.rb CHANGELOG.md Gemfile.lock
  VERSION=$(ruby -I lib -e "require 'pact/cli/version.rb'; puts Pact::Cli::VERSION")
  git commit -m "chore(release): version ${VERSION} [ci-skip]" && git push origin master
  TAG="${VERSION}.${RELEASE}"
  git tag -a ${TAG} -m "chore(release): version ${TAG}" && git push origin ${TAG}
  echo "Releasing from https://hub.docker.com/repository/docker/pactfoundation/pact-cli/builds"
else
  echo "No gems updated, not releasing"
fi
