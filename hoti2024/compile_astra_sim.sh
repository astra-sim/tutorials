#!/bin/bash
set -e

# Path
SCRIPT_DIR=$(dirname "$(realpath $0)")

# Install Chakra
(
cd ${SCRIPT_DIR}/astra-sim/build/astra_analytical
./build.sh
)
