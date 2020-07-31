#!/bin/sh

# Make the pact content dynamic so a new version gets published every time
if echo "$@" | grep "/pact/example/pacts" >/dev/null 2>&1 ; then
  echo "Generating a new version of the pact for this demo"
  cat /pact/example/pacts/pact.json | sed "s/\"1\"/\"$(date +%s)\"/g" > /tmp/pact.json
  mv /tmp/pact.json /pact/example/pacts/pact.json
fi

bundle exec $HOME/bin/pact "$@"
