#!/bin/sh

set -euo >/dev/null

bundle exec conventional-changelog version=${TAG} force=true
git add CHANGELOG.md
git add Gemfile.lock VERSION lib/pact/cli/version.rb
git commit -m "chore(release): version ${TAG}"
