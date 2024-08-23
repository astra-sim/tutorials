#!/bin/bash
set -e

# Path
SCRIPT_DIR=$(dirname "$(realpath $0)")

# Install Chakra
(
ln -s ${SCRIPT_DIR}/astra-sim/extern/graph_frontend/chakra ${SCRIPT_DIR}/chakra . # create symlink for easy access
cd ${SCRIPT_DIR}/chakra
pip3 install .
pip3 install --upgrade protobuf
)
