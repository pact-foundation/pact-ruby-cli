#!/bin/sh

set -eu

# If increment in null, then use the existing version number
# and just increase `n` by 1 in semver version x.y.z.n 
# as set in .github./workflows/release_image.yml
# as set in script/release.sh
if [ "${INCREMENT:-}" ]; then
  if [ "${INCREMENT:-}" != "null" ]; then
    bundle exec bump ${INCREMENT:-minor} --no-commit --replace-in $PWD/lib/pact/cli/version.rb > /dev/null
  fi
fi

gem_version=$(ruby -I lib -e "require 'pact/cli/version.rb'; puts Pact::Cli::VERSION")
existing_tags=$(git tag)
existing_release_numbers_for_current_gem_version=$(echo "$existing_tags" | grep "${gem_version}\." | sed 's/'${gem_version}'\.//g' | grep -E "^[0-9]+$" | cat)

if [ -n "${existing_release_numbers_for_current_gem_version}" ]; then
  last_release_number=$(printf "0\n${existing_release_numbers_for_current_gem_version}" | sort -g | tail -1)
  next_release_number=$(( $last_release_number + 1 ))
else
  next_release_number=0
fi

tag="${gem_version}.${next_release_number}"
echo $tag
