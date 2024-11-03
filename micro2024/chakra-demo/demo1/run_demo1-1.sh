#!/bin/bash
set -e

# Path
SCRIPT_DIR=$(dirname "$(realpath $0)")
CHAKRA=${SCRIPT_DIR}/../chakra

# Run CHAKRA ET Generator
(
mkdir ${SCRIPT_DIR}/traces
cd ${SCRIPT_DIR}/traces
chakra_generator --num_npus 8
)
