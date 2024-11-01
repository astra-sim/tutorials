#!/bin/bash
set -e

# Path
SCRIPT_DIR=$(dirname "$(realpath $0)")
STG=${SCRIPT_DIR}/../symbolic_tensor_graph

# Run Symbolic Tensor Graph (STG) Generator
(
python ${STG}/main.py --output_dir ${SCRIPT_DIR}/generated/ \
               --output_name workload.%d.et \
               --comm_group_file comm_group.json \
               --dp 2 --tp 2 --pp 2 \
               --weight_sharded 0
)
