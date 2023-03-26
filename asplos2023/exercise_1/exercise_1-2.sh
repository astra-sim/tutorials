#!/bin/bash
set -e

# Path
SCRIPT_DIR="$(dirname "$(realpath $0)")"
BINARY="${SCRIPT_DIR}/../build/analytical/AnalyticalAstra/bin/AnalyticalAstra"
RESULT_DIR="${SCRIPT_DIR}/result_1-2"

# Inputs
INPUT_DIR="${SCRIPT_DIR}/inputs"
WORKLOAD="${INPUT_DIR}/workload/all_reduce.txt"


# 1. Setup
rm -rf ${RESULT_DIR}
mkdir -p ${RESULT_DIR}

# 2. Run ASTRA-sim
"${BINARY}" \
    --run-name="Ring" \
    --network-configuration="${INPUT_DIR}/network/ring.json" \
    --system-configuration="${INPUT_DIR}/system/ring.txt" \
    --workload-configuration="${WORKLOAD}" \
    --path="${RESULT_DIR}/" \
    --total-stat-rows=3 \
    --stat-row=0

"${BINARY}" \
    --run-name="Switch" \
    --network-configuration="${INPUT_DIR}/network/switch.json" \
    --system-configuration="${INPUT_DIR}/system/switch.txt" \
    --workload-configuration="${WORKLOAD}" \
    --path="${RESULT_DIR}/" \
    --total-stat-rows=3 \
    --stat-row=1

"${BINARY}" \
    --run-name="FullyConnected" \
    --network-configuration="${INPUT_DIR}/network/fullyconnected.json" \
    --system-configuration="${INPUT_DIR}/system/fullyconnected.txt" \
    --workload-configuration="${WORKLOAD}" \
    --path="${RESULT_DIR}/" \
    --total-stat-rows=3 \
    --stat-row=2
