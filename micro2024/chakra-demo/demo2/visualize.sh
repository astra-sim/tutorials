#!/bin/bash
set -e

# Path
SCRIPT_DIR=$(dirname "$(realpath $0)")
TARGET_WORKLOAD="MLP_ModelParallel"

# Run visualizer
(
chakra_visualizer \
    --input_filename=${SCRIPT_DIR}/workload/"${TARGET_WORKLOAD:?}.0.et" \
    --output_filename=${SCRIPT_DIR}/${TARGET_WORKLOAD:?}.0.pdf
)
