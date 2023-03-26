#!/bin/bash
set -e

# Path
SCRIPT_DIR="$(dirname "$(realpath $0)")"
ANALYTICAL_BIN="${SCRIPT_DIR}/../build/analytical/AnalyticalAstra/bin/AnalyticalAstra"
CONGESTION_BIN="${SCRIPT_DIR}/../build/congestion/AstraCongestion/bin/AstraCongestion"
RESULT_DIR="${SCRIPT_DIR}/result_3-1"

# Inputs
NETWORK_DIR="${SCRIPT_DIR}/inputs/network"
SYSTEM="${SCRIPT_DIR}/inputs/system"
WORKLOAD="${SCRIPT_DIR}/inputs/workload/all_reduce.txt"


# 1. Setup
rm -rf "${RESULT_DIR}"
mkdir -p "${RESULT_DIR}"

# 2. Run ASTRA-sim
"${ANALYTICAL_BIN}" \
    --run-name="analytical" \
    --network-configuration="${NETWORK_DIR}/3d_switch.json" \
    --system-configuration="${SYSTEM}/3d_switch_baseline.txt" \
    --workload-configuration="${WORKLOAD}" \
    --comm-scale=1024 \
    --path="${RESULT_DIR}/" \
    --total-stat-rows 2 \
    --stat-row 0

"${ANALYTICAL_BIN}" \
    --run-name="themis" \
    --network-configuration="${NETWORK_DIR}/3d_switch.json" \
    --system-configuration="${SYSTEM}/3d_switch_themis.txt" \
    --workload-configuration="${WORKLOAD}" \
    --comm-scale=1024 \
    --path="${RESULT_DIR}/" \
    --total-stat-rows 2 \
    --stat-row 1
