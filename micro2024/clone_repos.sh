#!/bin/bash
set -e

# Path
SCRIPT_DIR=$(dirname "$(realpath $0)")

# Clone ASTRA-sim
(
git clone https://github.com/astra-sim/astra-sim.git
cd ${SCRIPT_DIR}/astra-sim/
<<<<<<< Updated upstream
git checkout tags/tutorial-micro2024-ns3fix250128
=======
git checkout tags/tutorial-micro2024-ns3fix250204
>>>>>>> Stashed changes
git submodule update --init --recursive
)

# Create Chakra symlink for easy access
(
ln -s astra-sim/extern/graph_frontend/chakra .
)

# Clone Param (required for real system trace conversion)
(
git clone https://github.com/facebookresearch/param.git
)

# Clone Symbolic Tensor Graph (STG) Generator
(
git clone https://github.com/astra-sim/symbolic_tensor_graph
)
