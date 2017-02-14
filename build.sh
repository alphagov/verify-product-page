#!/usr/bin/env bash

set -e

cd "$(dirname "$0")"

export PATH=.gem-bin:$PATH

bundle install --path=.gems --binstubs=.gem-bin
bower install

bundle exec middleman build
