#!/bin/sh

set -euo >/dev/null

if [[ $(git status --porcelain) ]]; then
    git add Gemfile.lock VERSION lib/pact/cli/version.rb
    git commit -m "chore(release): version ${TAG}"
fi