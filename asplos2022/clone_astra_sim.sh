#!/bin/bash
set -e

# Path
SCRIPT_DIR=$(dirname "$(realpath $0)")

# 1. Clone ASTRA-sim
git clone --recursive https://github.com/astra-sim/astra-sim.git

# 2. Set analytical backend branch
(
cd ${SCRIPT_DIR}/astra-sim/extern/network_backend/analytical/
git checkout asplos2022-tutorial
)
