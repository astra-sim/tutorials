#!/bin/bash
set -e

# Path
SCRIPT_DIR="$(dirname "$(realpath $0)")"
BINARY="${SCRIPT_DIR}/../build/analytical/AnalyticalAstra/bin/AnalyticalAstra"
RESULT_DIR="${SCRIPT_DIR}/result_2"

# Inputs
INPUT_DIR="${SCRIPT_DIR}/inputs"
WORKLOAD="${INPUT_DIR}/all_reduce.txt"


# 1. Setup
rm -rf ${RESULT_DIR}
mkdir -p ${RESULT_DIR}

# 2. Run ASTRA-sim
"${BINARY}" \
    --run-name="Ring" \
    --network-configuration="${INPUT_DIR}/ring.json" \
    --system-configuration="${INPUT_DIR}/ring.txt" \
    --workload-configuration="${WORKLOAD}" \
    --comm-scale="1024" \
    --path="${RESULT_DIR}/" \
    --total-stat-rows=3 \
    --stat-row=0

"${BINARY}" \
    --run-name="Switch" \
    --network-configuration="${INPUT_DIR}/switch.json" \
    --system-configuration="${INPUT_DIR}/switch.txt" \
    --workload-configuration="${WORKLOAD}" \
    --comm-scale="1024" \
    --path="${RESULT_DIR}/" \
    --total-stat-rows=3 \
    --stat-row=1

"${BINARY}" \
    --run-name="FullyConnected" \
    --network-configuration="${INPUT_DIR}/fullyconnected.json" \
    --system-configuration="${INPUT_DIR}/fullyconnected.txt" \
    --workload-configuration="${WORKLOAD}" \
    --comm-scale="1024" \
    --path="${RESULT_DIR}/" \
    --total-stat-rows=3 \
    --stat-row=2
