#!/bin/bash
set -e

# Path
SCRIPT_DIR="$(dirname "$(realpath $0)")"
BINARY="${SCRIPT_DIR}/../build/AnalyticalAstra/bin/AnalyticalAstra"
ANALYTICAL_DIR="${SCRIPT_DIR}/../astra-sim/build/astra_analytical"
RESULT_DIR="${SCRIPT_DIR}/result"

# Inputs
NETWORK="${SCRIPT_DIR}/inputs/ring.json"
SYSTEM="${SCRIPT_DIR}/inputs/ring.txt"
WORKLOAD="${SCRIPT_DIR}/inputs/all_reduce.txt"


# 1. Setup
rm -rf ${RESULT_DIR}
mkdir -p ${RESULT_DIR}

# 2. Run ASTRA-sim
"${BINARY}" \
    --run-name="Exercise 1" \
    --network-configuration="${NETWORK}" \
    --system-configuration="${SYSTEM}" \
    --workload-configuration="${WORKLOAD}" \
    --path="${RESULT_DIR}/"
