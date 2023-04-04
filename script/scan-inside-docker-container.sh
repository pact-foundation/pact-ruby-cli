#!/usr/bin/env sh
set -eu

# TODO set exit code back to 1

# TODO - Remove conditional when https://github.com/aquasecurity/trivy/pull/3985 merged
if [[ "$(uname -m)" == 'armv7l' ]]; then
  # wget -q -O - https://github.com/aquasecurity/trivy/releases/download/v0.39.0/trivy_0.39.0_Linux-ARM.tar.gz | tar xvz -C /usr/local/bin
  wget -q -O - https://raw.githubusercontent.com/YOU54F/trivy/patch-1/contrib/install.sh | sh -s -- -b /usr/local/bin
else
  wget -q -O - https://raw.githubusercontent.com/aquasecurity/trivy/master/contrib/install.sh | sh -s -- -b /usr/local/bin
fi

trivy filesystem --exit-code 0 --no-progress /
