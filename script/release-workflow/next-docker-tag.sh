#!/bin/sh

set -eu

gem_version_from_gemfile_lock() {
  grep "pact_broker (" pact_broker/Gemfile.lock | awk -F '[()]' '{print $2}'
}

gem_version=$(ruby -I lib -e "require 'pact/cli/version.rb'; puts Pact::Cli::VERSION")
existing_tags=$(wget -q https://registry.hub.docker.com/v1/repositories/${DOCKER_IMAGE_ORG_AND_NAME}/tags -O - | jq -r .[].name | sed 's/-[0-9]$/.1/g')
existing_release_numbers_for_current_gem_version=$(echo "$existing_tags" | grep "${gem_version}\." | sed 's/'${gem_version}'\.//g' | grep -E "^[0-9]+$" | cat)

if [ -n "${existing_release_numbers_for_current_gem_version}" ]; then
  last_release_number=$(printf "0\n${existing_release_numbers_for_current_gem_version}" | sort -g | tail -1)
  next_release_number=$(( $last_release_number + 1 ))
else
  next_release_number=0
fi

tag="${gem_version}.${next_release_number}"
echo $tag
