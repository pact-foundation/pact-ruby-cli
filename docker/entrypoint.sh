#!/bin/sh

PACT_COMMANDS=" broker help mock-service publish stub-service verify version "

# git branch detection command fails due to cve fix https://github.blog/2022-04-12-git-security-vulnerability-announced/
# fatal: unsafe repository (REPO is owned by someone else) in other workflow steps after running checkout
# https://github.com/actions/checkout/issues/766
git config --global --add safe.directory "*" 

if [ -n "$1" ] && echo "$PACT_COMMANDS" | grep -F " $1 " > /dev/null 2>&1 ; then
  # Make the pact content dynamic so a new version gets published every time
  if echo "$@" | grep "/pact/example/pacts" >/dev/null 2>&1 ; then
    echo "Generating a new version of the pact for this demo"
    cat /pact/example/pacts/pact.json | sed "s/\"1\"/\"$(date +%s)\"/g" > /tmp/pact.json
    mv /tmp/pact.json /pact/example/pacts/pact.json
  fi

  pact "$@"
else
  exec "$@"
fi
