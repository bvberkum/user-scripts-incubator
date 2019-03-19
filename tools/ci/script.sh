#!/usr/bin/env bash
# CI suite stage 4. See .travis.yml
set -u
export_stage script && announce_stage

$LOG note "" "Running main steps" "$(suite_from_table "build.txt" Parts CI 4 | tr '\n' ';')"
sh_include start
suite_run "build.txt" CI 4
sh_include finish


close_stage && ci_announce "Done"
set +eu
return $fail_cnt
# Sync: U-S:
