#!/bin/sh

# THIS IS A MESS and doesn't work.

set -e

unset X_PACT_DEVELOPMENT

git pull origin master

bundle exec rake package:update

if git log -1 | grep "feat(gems)"; then
  bundle exec bump ${1:-minor} --no-commit
  bundle exec rake generate_changelog
  git add lib/pact/cli/version.rb CHANGELOG.md Gemfile.lock
  VERSION=$(ruby -I lib -e "require 'pact/cli/version.rb'; puts Pact::Cli::VERSION")
  git commit -m "chore(release): version ${VERSION} [ci-skip]" && git push origin master
  RELEASE=1
  TAG="${VERSION}-${RELEASE}"
  git tag -a ${TAG} -m "chore(release): version ${TAG}" && git push origin ${TAG}
else
  echo "No gems updated, not releasing"
fi