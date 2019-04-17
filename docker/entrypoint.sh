#!/bin/sh

# Make the pact content dynamic so a new version gets published every time
if echo "$@" | grep "/pact/example/pacts" >/dev/null 2>&1 ; then
  echo "Generating a new version of the Foo/Bar pact for this demo"
  cat /pact/example/pacts/foo-bar.json | sed "s/\"1\"/\"$(date +%s)\"/g" > /tmp/foo-bar.json
  mv /tmp/foo-bar.json /pact/example/pacts/foo-bar.json
fi

cd $HOME
bundle exec bin/pact "$@"