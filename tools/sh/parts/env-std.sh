#!/usr/bin/env bash

: "${LOG:="$CWD/tools/sh/log.sh"}"
: "${CS:="dark"}"
: "${DEBUG:=}"
: "${verbosity:=}"
test -z "${v-}" || verbosity=$v
# Sync: U-S:
