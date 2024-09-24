#!/bin/bash
set -e

# Path
SCRIPT_DIR=$(dirname "$(realpath $0)")

# Compile ASTRA-sim with analytical model
(
cd ${SCRIPT_DIR}/astra-sim/build/astra_analytical
./build.sh
)
