#!/bin/bash
set -e

# Path
SCRIPT_DIR=$(dirname "$(realpath $0)")
ASTRA_SIM_BUILD_DIR=${SCRIPT_DIR}/../../astra-sim/extern/network_backend/ns-3/build/scratch/
ASTRA_SIM=./ns3.42-AstraSimNetwork-default

# Run ASTRA-sim
(
cd ${ASTRA_SIM_BUILD_DIR}
touch ../../scratch/output/flow.txt
${ASTRA_SIM} \
    --workload-configuration=${SCRIPT_DIR}/allreduce_1D/allreduce_128/allreduce \
    --system-configuration=${SCRIPT_DIR}/inputs/Ring_sys.json \
    --remote-memory-configuration=${SCRIPT_DIR}/inputs/RemoteMemory.json \
    --logical-topology-configuration=${SCRIPT_DIR}/inputs/logical_128nodes_1D.json \
    --network-configuration=../../../ns-3/scratch/config/config_clos.txt \
)
