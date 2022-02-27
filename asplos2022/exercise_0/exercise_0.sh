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
    --network-configuration="${NETWORK}" \
    --system-configuration="${SYSTEM}" \
    --workload-configuration="${WORKLOAD}" \
    --path="${RESULT_DIR}" \
    --run-name "exercise_0" \
    --num-passes 1 \
    --total-stat-rows 1 \
    --stat-row 0 \
    --compute-scale 1 \
    --comm-scale 1 \
    --num-queues-per-dim 1 \
    --injection-scale 1 \
    --rendezvous-protocol false
