#!/bin/bash
set -x

cd "$(dirname "$0")"

# Tell bower we're in CI mode
: ${CI:+true}
export CI

./build.sh
CF_PASS=$CF_PASS CF_USER=$CF_USER ./deploy-to-paas.sh

