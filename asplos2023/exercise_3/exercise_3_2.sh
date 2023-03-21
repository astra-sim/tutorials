#!/bin/bash
set -e

# Path
SCRIPT_DIR="$(dirname "$(realpath $0)")"
BINARY="${SCRIPT_DIR}/../build/analytical/AnalyticalAstra/bin/AnalyticalAstra"
RESULT_DIR="${SCRIPT_DIR}/result_2"

# Inputs
INPUT_DIR="${SCRIPT_DIR}/inputs"
WORKLOAD="${INPUT_DIR}/gpt3.txt"


# 1. Setup
rm -rf ${RESULT_DIR}
mkdir -p ${RESULT_DIR}

# 2. Run ASTRA-sim
"${BINARY}" \
    --run-name="DGX2-GPT3" \
    --network-configuration="${INPUT_DIR}/dgx2.json" \
    --system-configuration="${INPUT_DIR}/dgx2.txt" \
    --workload-configuration="${WORKLOAD}" \
    --compute-scale="0.41" \
    --path="${RESULT_DIR}/" \
    --total-stat-rows=2 \
    --stat-row=0

"${BINARY}" \
    --run-name="TPU-GPT3" \
    --network-configuration="${INPUT_DIR}/tpu.json" \
    --system-configuration="${INPUT_DIR}/tpu.txt" \
    --workload-configuration="${WORKLOAD}" \
    --path="${RESULT_DIR}/" \
    --total-stat-rows=2 \
    --stat-row=1
