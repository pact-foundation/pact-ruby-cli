#!/bin/sh

set -eou >/dev/null

git add Gemfile.lock
git commit -m "feat(gems): $COMMIT_MESSAGE

[ci-skip]"
git push
