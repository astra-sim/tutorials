#!/bin/bash
set -e

# Path
SCRIPT_DIR=$(dirname "$(realpath $0)")

# Intall Chakra (Use Chakra fork in ASTRA-Sim repo).
(
cd ${SCRIPT_DIR}/chakra
pip3 install .
)

# Install PARAM (required for real system trace conversion)
(
cd ${SCRIPT_DIR}/param/et_replay
git checkout 7b19f586dd8b267333114992833a0d7e0d601630
pip install .
)

# Install Holistic Trace Analysis (required for Ciritical Path Analysis)
(
cd ${SCRIPT_DIR}/HolisticTraceAnalysis
git checkout d731cc2e2249976c97129d409a83bd53d93051f6
git submodule update --init
pip install -r requirements.txt
pip install -e .
)
