#!/bin/sh

set -e

if [ -n "${RELEASED_GEM_NAME}" ] && [ -n "${RELEASED_GEM_VERSION}" ]; then
  echo "Installing $RELEASED_GEM_NAME version $RELEASED_GEM_VERSION"
  gem install $RELEASED_GEM_NAME -v $RELEASED_GEM_VERSION
  bundle update $RELEASED_GEM_NAME

  if [ -z "$(git diff Gemfile.lock | grep + | grep " ${RELEASED_GEM_NAME} " || true)" ]; then
    echo "Could not update $RELEASED_GEM_NAME to $RELEASED_GEM_VERSION. Exiting."
    exit 1
  fi
fi

bundle update

if ! git diff-index --quiet HEAD Gemfile.lock; then
  updated_gems=$(git diff Gemfile.lock | grep + | grep pact | sed -e "s/+ *//" | ruby -e 'puts ARGF.read.split("\n").join(", ")')
  echo "::set-output name=commit_message::updated ${updated_gems}"
else
  echo "No gems updated. Exiting."
  exit 1
fi