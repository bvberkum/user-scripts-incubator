#!/usr/bin/env bash

# Boilerplate env for CI scripts

test -z "${ci_env_:-}" && ci_env_=1 || exit 98 # Recursion

: "${CWD:="$PWD"}"
: "${sh_tools:="$CWD/tools/sh"}"

. "$sh_tools/parts/env-strict.sh"
. "$sh_tools/parts/env-0-1-lib-sys.sh"

ci_env_ts=$($gdate +"%s.%N")
ci_stages="${ci_stages:-} ci_env"

: "${SUITE:="CI"}"
#: "${DEBUG:=1}"
: "${keep_going:=1}" # No-Sync

sh_env_ts=$($gdate +"%s.%N")
ci_stages="$ci_stages sh_env"

. "${CWD}/tools/sh/env.sh"

test -n "${ci_util_:-}" || {

  . "$ci_tools/util.sh"
}

sh_env_end_ts=$($gdate +"%s.%N")
test -n "${IS_BASH:-}" || $INIT_LOG error "Not OK" "Need to know shell dist" "" 1

$INIT_LOG note "" "CI Env pre-load time: $(echo "$sh_env_ts - $ci_env_ts"|bc) seconds"
ci_env_end_ts=$($gdate +"%s.%N")
$INIT_LOG note "" "Sh Env load time: $(echo "$ci_env_end_ts - $ci_env_ts"|bc) seconds"
print_yellow "ci:env" "Starting: $0 '$*'" >&2
# Sync: U-S:
