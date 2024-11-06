#!/bin/bash
set -e

# Path
SCRIPT_DIR=$(dirname "$(realpath $0)")

# Install MSCCL-tools
(

cd ${SCRIPT_DIR}/collectiveapi/msccl-tools
pip install .
)
