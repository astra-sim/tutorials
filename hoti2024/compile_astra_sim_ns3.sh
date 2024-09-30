#!/bin/bash
set -e

# Path
SCRIPT_DIR=$(dirname "$(realpath $0)")

# Compile ASTRA-sim with ns3 backend model
(
cd ${SCRIPT_DIR}/astra-sim
bash ./build/astra_ns3/build.sh -c
)

# Create Symlinks to configuration files
# Symbolic links are only to make it easier to examine. 
# Inputs to execution scripts, etc. need to use the actual files.
ln -s astra-sim/extern/network_backend/ns-3/scratch/config/config.txt ./demo4/inputs/ns3_config_switch.txt
ln -s astra-sim/extern/network_backend/ns-3/scratch/config/config_clos.txt ./demo4/inputs/ns3_config_clos.txt
ln -s astra-sim/extern/network_backend/ns-3/scratch/topology/8_nodes_1_switch_topology.txt ./demo4/inputs/8_nodes_1_switch.txt
ln -s astra-sim/extern/network_backend/ns-3/scratch/topology/128_nodes_16_switch_topology.txt ./demo4/inputs/128_nodes_16_switch_clos.txt
ln -s $(realpath ./demo1/allreduce) ./demo4/allreduce

