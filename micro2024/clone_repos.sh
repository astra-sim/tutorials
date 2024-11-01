#!/bin/bash
set -e

# Path
SCRIPT_DIR=$(dirname "$(realpath $0)")

# Clone ASTRA-sim
(
git clone git@github.com:astra-sim/astra-sim.git
cd ${SCRIPT_DIR}/astra-sim/
git checkout tags/tutorial-hoti2024
git submodule update --init --recursive
)

# Clone Chakra
(
git clone https://github.com/astra-sim/chakra.git
)

# Clone Param (required for real system trace conversion)
(
git clone git@github.com:facebookresearch/param.git
)

# Clone Holictic Trace Analysis (required for Ciritical Path Analysis)
(
git clone https://github.com/facebookresearch/HolisticTraceAnalysis.git
)
