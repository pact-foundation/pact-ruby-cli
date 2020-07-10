#!/bin/bash

bundle exec bump minor --no-commit
export VERSION=$(ruby -I lib -e "require 'pact/cli/version.rb'; puts Pact::Cli::VERSION")
export RELEASE=0
bundle exec rake generate_changelog
git diff CHANGELOG.md
echo "::set-env name=TAG::bethtest-${VERSION}.${RELEASE}"
