#!/bin/bash
set -e

# Path
SCRIPT_DIR=$(dirname "$(realpath $0)")
ASTRA_SIM=${SCRIPT_DIR}/../../astra-sim/build/astra_analytical/build/bin/AstraSim_Analytical_Congestion_Unaware

# Run ASTRA-sim
(
${ASTRA_SIM} \
    --workload-configuration=${SCRIPT_DIR}/workload/MLP_ModelParallel \
    --system-configuration=${SCRIPT_DIR}/inputs/TPUv4.json \
    --network-configuration=${SCRIPT_DIR}/inputs/TPUv4-net.yml \
    --remote-memory-configuration=${SCRIPT_DIR}/inputs/RemoteMemory.json
)
