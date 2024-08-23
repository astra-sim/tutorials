#!/bin/bash
set -e

# Path
SCRIPT_DIR=$(dirname "$(realpath $0)")

# Install Chakra
(
cd ${SCRIPT_DIR}/astra-sim/extern/graph_frontend/chakra
pip3 install .
pip3 install --upgrade protobuf
)
