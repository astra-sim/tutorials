#!/bin/bash
set -e

# Path
SCRIPT_DIR=$(dirname "$(realpath $0)")
ASTRA_SIM=${SCRIPT_DIR}/../astra-sim/build/astra_analytical/build/bin/AstraSim_Analytical_Congestion_Aware

# Run ASTRA-sim
(
${ASTRA_SIM} \
    --workload-configuration=${SCRIPT_DIR}/../demo1/allreduce/allreduce \
    --system-configuration=${SCRIPT_DIR}/inputs/Ring_chakra.json \
    --network-configuration=${SCRIPT_DIR}/inputs/Ring_8.yml \
    --remote-memory-configuration=${SCRIPT_DIR}/inputs/RemoteMemory.json
)
