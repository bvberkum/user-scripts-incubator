export_stage install && announce_stage

# Get checkouts, tool installs and rebuild env (PATH etc.)
. ./tools/ci/parts/install.sh &&
script_env_init=tools/ci/parts/env.sh . ./tools/sh/env.sh

. $ci_util/deinit.sh
