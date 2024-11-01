#!/bin/bash
set -e

# Path
SCRIPT_DIR=$(dirname "$(realpath $0)")

# Run visualizer
(
mkdir -p ${SCRIPT_DIR}/workload_chakra
python3 -m chakra.et_converter.et_converter \
    --input_type="Text" \
    --input_filename="${SCRIPT_DIR}/workload_text.txt" \
    --output_filename="${SCRIPT_DIR}/workload_chakra/workload_chakra" \
    --num_npus=8 \
    --num_dims=1 \
    --num_passes=1
)
