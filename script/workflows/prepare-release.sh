#!/bin/sh

set -e

if [ -z "${RELEASE}" ]; then
  bundle exec bump ${INCREMENT:-minor} --no-commit
  export RELEASE=0
fi

export VERSION=$(ruby -I lib -e "require 'pact/cli/version.rb'; puts Pact::Cli::VERSION")
bundle exec rake generate_changelog
git diff CHANGELOG.md
echo "::set-output name=tag::${VERSION}.${RELEASE}"
