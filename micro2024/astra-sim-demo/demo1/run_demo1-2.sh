#!/bin/bash
set -e

# Path
SCRIPT_DIR=$(dirname "$(realpath $0)")
ASTRA_SIM=${SCRIPT_DIR}/../../astra-sim/build/astra_analytical/build/bin/AstraSim_Analytical_Congestion_Aware

# Run ASTRA-sim
(
${ASTRA_SIM} \
    --workload-configuration=${SCRIPT_DIR}/allreduce/allreduce \
    --system-configuration=${SCRIPT_DIR}/inputs/Direct_sys.json \
    --network-configuration=${SCRIPT_DIR}/inputs/FullyConnected_8.yml \
    --remote-memory-configuration=${SCRIPT_DIR}/inputs/RemoteMemory.json
)
