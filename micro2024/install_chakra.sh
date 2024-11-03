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
git config --global --add safe.directory /app/micro2024/param
cd ${SCRIPT_DIR}/param/et_replay
git checkout 7b19f586dd8b267333114992833a0d7e0d601630
pip install .
)
