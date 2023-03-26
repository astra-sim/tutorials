#!/bin/bash
set -e

# Path
SCRIPT_DIR="$(dirname "$(realpath $0)")"
BINARY="${SCRIPT_DIR}/../build/analytical/AnalyticalAstra/bin/AnalyticalAstra"
RESULT_DIR="${SCRIPT_DIR}/result_2-1"

# Inputs
INPUT_DIR="${SCRIPT_DIR}/inputs"
WORKLOAD="${INPUT_DIR}/workload/vgg16.txt"


# 1. Setup
rm -rf ${RESULT_DIR}
mkdir -p ${RESULT_DIR}

# 2. Run ASTRA-sim
"${BINARY}" \
    --run-name="DGX2-VGG16" \
    --network-configuration="${INPUT_DIR}/network/dgx2.json" \
    --system-configuration="${INPUT_DIR}/system/dgx2.txt" \
    --workload-configuration="${WORKLOAD}" \
    --compute-scale="0.41" \
    --path="${RESULT_DIR}/" \
    --total-stat-rows=2 \
    --stat-row=0

"${BINARY}" \
    --run-name="TPU-VGG16" \
    --network-configuration="${INPUT_DIR}/network/tpu.json" \
    --system-configuration="${INPUT_DIR}/system/tpu.txt" \
    --workload-configuration="${WORKLOAD}" \
    --path="${RESULT_DIR}/" \
    --total-stat-rows=2 \
    --stat-row=1
