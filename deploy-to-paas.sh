#!/bin/bash

set -eux
set -o pipefail

cd "$(dirname "$0")"
BASEDIR=$(pwd)

cfLogin() {
  if [ -z "${CF_USER:-}" ]; then
    echo "Using cached credentials in ${CF_HOME:-home directory}" >&2
  else
    CF_API="${CF_API:?CF_USER is set - CF_API environment variable also needs to be set}"
    CF_ORG="${CF_ORG:?CF_USER is set - CF_ORG environment variable also needs to be set}"
    CF_SPACE="${CF_SPACE:?CF_USER is set - CF_SPACE environment variable also needs to be set}"
    CF_PASS="${CF_PASS:?CF_USER is set - CF_PASS environment variable also needs to be set}"

    # CloudFoundry will cache credentials in ~/.cf/config.json by default.
    # Create a dedicated work area to avoid contaminating the user's credential cache
    export CF_HOME="$BASEDIR"/work
    rm -rf "$CF_HOME"
    mkdir -p "$CF_HOME"

    echo "Authenticating to CloudFoundry at '$CF_API' ($CF_ORG/$CF_SPACE) as '$CF_USER'" >&2
    cf api "$CF_API"
    # Like 'cf login' but for noninteractive use
    cf auth "$CF_USER" "$CF_PASS"
    cf target -o "$CF_ORG" -s "$CF_SPACE"

    # More secure (but maybe less reliable) way:
    # cf login -a "$CF_API" -u "$CF_USER" <<<"$CF_PASS"
  fi
}

cfLogin
sleep 240
cf push -f manifest.yml
cf logout || :
