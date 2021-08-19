#!/usr/bin/env sh
set -eu

# TODO set exit code back to 1

wget -q -O - https://raw.githubusercontent.com/aquasecurity/trivy/master/contrib/install.sh | sh -s -- -b /usr/local/bin
trivy filesystem --exit-code 0 --no-progress /
