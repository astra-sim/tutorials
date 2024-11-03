#!/bin/bash
set -e

# Path
SCRIPT_DIR=$(dirname "$(realpath $0)")

# Compile ASTRA-sim with ns3 backend model
(
cd ${SCRIPT_DIR}/astra-sim
bash ./build/astra_ns3/build.sh 
)
