#!/bin/sh

# THIS IS A MESS and doesn't work.

set -e

unset X_PACT_DEVELOPMENT

git pull origin master

bundle exec rake package:update

if git log -1 | grep "feat(gems)"; then
  bundle exec bump ${1:-minor} --no-commit
  RELEASE=${RELEASE:-0}
  bundle exec rake generate_changelog

else
  echo "No gems updated, not releasing"
fi

