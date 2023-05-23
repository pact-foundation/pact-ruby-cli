#!/bin/sh

set -euo >/dev/null

git add Gemfile.lock
git add lib/pact/cli/version.rb 
PACT_CLI_VERSION=$(ruby -I lib -e "require 'pact/cli/version.rb'; puts Pact::Cli::VERSION")

if [ -n "${RELEASED_GEM_NAME}" ] && [ -n "${RELEASED_GEM_VERSION}" ]; then
  git commit -m "feat(gems): pact-cli v$PACT_CLI_VERSION: update ${RELEASED_GEM_NAME} gem to version ${RELEASED_GEM_VERSION}

[ci-skip]
"
else
  updated_gems=$(git diff --staged Gemfile.lock | grep '^+' | grep '(' | sed -e "s/+ *//" | paste -sd "," - | sed -e 's/,/, /g')
  git commit -m "feat(gems): pact-cli v$PACT_CLI_VERSION: update to ${updated_gems}

[ci-skip]
"
fi

git push
