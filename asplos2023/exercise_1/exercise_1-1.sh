#!/bin/bash
set -e

# Path
SCRIPT_DIR="$(dirname "$(realpath $0)")"
BINARY="${SCRIPT_DIR}/../build/analytical/AnalyticalAstra/bin/AnalyticalAstra"
RESULT_DIR="${SCRIPT_DIR}/result_1-1"

# Inputs
NETWORK="${SCRIPT_DIR}/inputs/network/ring.json"
SYSTEM="${SCRIPT_DIR}/inputs/system/ring.txt"
WORKLOAD="${SCRIPT_DIR}/inputs/workload/all_reduce.txt"


# 1. Setup
rm -rf "${RESULT_DIR}"
mkdir -p "${RESULT_DIR}"

# 2. Run ASTRA-sim
"${BINARY}" \
    --run-name="Exercise 1" \
    --network-configuration="${NETWORK}" \
    --system-configuration="${SYSTEM}" \
    --workload-configuration="${WORKLOAD}" \
    --path="${RESULT_DIR}/"
