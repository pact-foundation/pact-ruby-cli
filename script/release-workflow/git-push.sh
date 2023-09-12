#!/bin/sh

set -euo >/dev/null

if [[ $(git status --porcelain) ]]; then
    git add Gemfile.lock VERSION lib/pact/cli/version.rb
    git commit -m "chore(release): version ${TAG}"
fi
git tag -a "${TAG}" -m "chore(release): version ${TAG}"
git push origin ${TAG}
git push origin master
