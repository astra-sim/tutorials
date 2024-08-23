#!/bin/bash
set -e

# Path
SCRIPT_DIR=$(dirname "$(realpath $0)")

# Clone ASTRA-sim
(
git clone git@github.com:astra-sim/astra-sim.git
cd ${SCRIPT_DIR}/astra-sim/
git checkout tags/tutorial-hoti2024
git submodule update --init --recursive
)

# Create Chakra symlink for easy access
(
ln -s ${SCRIPT_DIR}/astra-sim/extern/graph_frontend/chakra .
)
