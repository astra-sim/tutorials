#!/bin/bash
set -e

# Path
SCRIPT_DIR=$(dirname "$(realpath $0)")

# Install Chakra
(

cd ${SCRIPT_DIR}/chakra
pip3 install .
)

# Instead of Using Chakra in ASTRA-Sim. Use Chakra fork in ASTRA-Sim repo.
# Install PARAM (required for real system trace conversion)
#(
#cd ${SCRIPT_DIR}/astra-sim/extern/graph_frontend/param
#git checkout 7b19f586dd8b267333114992833a0d7e0d601630
#cd et_replay
#pip3 install .
#)
