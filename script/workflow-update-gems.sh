#!/bin/bash

gem install bundler -v 2.0.2 --no-ri --no-rdoc && bundle update



if ! git diff-index --quiet HEAD Gemfile.lock; then
  updated_gems=$(git diff Gemfile.lock | grep + | grep pact | sed -e "s/+ *//" | ruby -e 'puts ARGF.read.split("\n").join(", ")')
  echo "::set-env name=COMMIT_MESSAGE::updated ${updated_gems}"
fi

