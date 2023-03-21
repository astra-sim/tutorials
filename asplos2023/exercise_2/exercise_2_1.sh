#!/bin/bash
set -e

# Path
SCRIPT_DIR="$(dirname "$(realpath $0)")"
BINARY="${SCRIPT_DIR}/../build/analytical/AnalyticalAstra/bin/AnalyticalAstra"
RESULT_DIR="${SCRIPT_DIR}/result_1"

# Inputs
NETWORK="${SCRIPT_DIR}/inputs/ring.json"
SYSTEM="${SCRIPT_DIR}/inputs/ring.txt"
WORKLOAD="${SCRIPT_DIR}/inputs/all_reduce.txt"


# 1. Setup
rm -rf ${RESULT_DIR}
mkdir -p ${RESULT_DIR}

# 2. Run ASTRA-sim
SIZES=(1 2 4 8 16 32 64 128 256 512 1024)
for i in {0..10}; do
    size=${SIZES[$i]}

    "${BINARY}" \
        --run-name="${size}" \
        --network-configuration="${NETWORK}" \
        --system-configuration="${SYSTEM}" \
        --workload-configuration="${WORKLOAD}" \
        --comm-scale="${size}" \
        --path="${RESULT_DIR}/" \
        --total-stat-rows=11 \
        --stat-row=$i
done
