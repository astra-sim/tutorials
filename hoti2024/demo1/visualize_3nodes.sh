#!/bin/bash
set -e

# Path
SCRIPT_DIR=$(dirname "$(realpath $0)")

# Run visualizer
(
python3 -m chakra.et_visualizer.et_visualizer \
    --input_filename=${SCRIPT_DIR}/3nodes/3nodes.0.et \
    --output_filename=${SCRIPT_DIR}/3nodes.0.pdf
)
