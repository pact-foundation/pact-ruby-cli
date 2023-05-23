#!/bin/sh

if [ -z "$(git diff Gemfile.lock)" ] ; then
  echo "No gems updated. Exiting."
  exit 1
else
  echo "Gems updated, continuing with release."
fi
