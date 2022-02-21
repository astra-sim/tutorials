#! /bin/bash -v

# Absolue path to this script
SCRIPT_DIR=$(dirname "$(realpath $0)")

# Absolute paths to useful directories
BINARY="${SCRIPT_DIR:?}"/../build/astra_analytical/build/AnalyticalAstra/bin/AnalyticalAstra
NETWORK="${SCRIPT_DIR:?}"/../inputs/network/analytical/ring.json
SYSTEM="${SCRIPT_DIR:?}"/../inputs/system/ring.txt
WORKLOAD="${SCRIPT_DIR:?}"/../inputs/workload/all_reduce.txt
STATS="${SCRIPT_DIR:?}"/results/exercise_0

rm -rf "${STATS}"
mkdir "${STATS}"

"${BINARY}" \
--network-configuration="${NETWORK}" \
--system-configuration="${SYSTEM}" \
--workload-configuration="${WORKLOAD}" \
--path="${STATS}/" \
--run-name="exercise_0" \
--num-passes=1 \
--total-stat-rows=1 \
--stat-row=0
