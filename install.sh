#!/bin/bash
#
# Usage: ./install.sh [niri] [umbriel]
# With no arguments both compositors are installed.

set -euo pipefail

export INSTALL_HOME="$(cd "$(dirname "$0")" && pwd)"

start=$(date +%s)

source "$INSTALL_HOME/lib/all.sh"
source "$INSTALL_HOME/preflight/all.sh"
source "$INSTALL_HOME/base/all.sh"
for c in "${compositors[@]}"; do
  run_script "$INSTALL_HOME/$c/$c.sh"
done

end=$(date +%s)
elapsed=$((end - start))

log SUCCESS "Finished in $((elapsed / 60))m $((elapsed % 60))s"
