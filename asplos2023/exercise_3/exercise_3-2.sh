#!/bin/bash
set -e

# Path
SCRIPT_DIR="$(dirname "$(realpath $0)")"
ANALYTICAL_BIN="${SCRIPT_DIR}/../build/analytical/AnalyticalAstra/bin/AnalyticalAstra"
CONGESTION_BIN="${SCRIPT_DIR}/../build/congestion/AstraCongestion/bin/AstraCongestion"
RESULT_DIR="${SCRIPT_DIR}/result_3-2"

# Inputs
NETWORK_DIR="${SCRIPT_DIR}/inputs/network"
SYSTEM="${SCRIPT_DIR}/inputs/system/direct.txt"
WORKLOAD="${SCRIPT_DIR}/inputs/workload/all_reduce.txt"


# 1. Setup
rm -rf "${RESULT_DIR}"
mkdir -p "${RESULT_DIR}"

# 2. Run ASTRA-sim
"${ANALYTICAL_BIN}" \
    --run-name="analytical" \
    --network-configuration="${NETWORK_DIR}/switch_analytical.json" \
    --system-configuration="${SYSTEM}" \
    --workload-configuration="${WORKLOAD}" \
    --comm-scale=1024 \
    --path="${RESULT_DIR}/" \
    --total-stat-rows 2 \
    --stat-row 0

"${CONGESTION_BIN}" \
  --run-name="congestion" \
  --network-configuration="${NETWORK_DIR}/switch_congestion.yml" \
  --system-configuration="${SYSTEM}" \
  --workload-configuration="${WORKLOAD}" \
  --comm-scale=1024 \
  --path="${RESULT_DIR}/" \
  --total-stat-rows 2 \
  --stat-row 1
