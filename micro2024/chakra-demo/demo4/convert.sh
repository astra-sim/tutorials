#!/bin/bash
set -e

# Path
SCRIPT_DIR=$(dirname "$(realpath $0)")

# Convert PyTorch ET+ into Chakra ET
(
mkdir -p ${SCRIPT_DIR}/chakra_traces

# Convert Traces: NPU 0
chakra_converter PyTorch \
    --input="${SCRIPT_DIR}/json_traces/hdt_0.json" \
    --output="${SCRIPT_DIR}/chakra_traces/et.0.et" \

# Convert Traces: NPU 1
chakra_converter PyTorch \
    --input="${SCRIPT_DIR}/json_traces/hdt_1.json" \
    --output="${SCRIPT_DIR}/chakra_traces/et.1.et" \
)
