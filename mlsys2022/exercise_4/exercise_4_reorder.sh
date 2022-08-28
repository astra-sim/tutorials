#! /bin/bash -v

SCRIPT_DIR=$(dirname "$(realpath $0)")
BINARY="${SCRIPT_DIR}/../build/AnalyticalAstra/bin/AnalyticalAstra"
NETWORK="${SCRIPT_DIR}/inputs/network/analytical/sample_Torus3D.json"
SYSTEM="${SCRIPT_DIR}/inputs/system/sample_torus_sys.txt"
WORKLOAD="${SCRIPT_DIR}/inputs/workload/exercise_4_reorder.txt"
RESULT_DIR="${SCRIPT_DIR}/exercise_4_reorder"

# 1. Setup
rm -rf ${RESULT_DIR}
mkdir -p ${RESULT_DIR}

# 2. Run ASTRA-sim
"${BINARY}" \
--run-name="exercise_4_reorder" \
--network-configuration="${NETWORK}" \
--system-configuration="${SYSTEM}" \
--workload-configuration="${WORKLOAD}" \
--path="${RESULT_DIR}/" \
--num-passes=20 \
--total-stat-rows=1 \
--stat-row=0
