#!/bin/bash
set -e

# Path
SCRIPT_DIR=$(dirname "$(realpath $0)")
TARGET_WORKLOAD="MLP_ModelParallel"

# Run visualizer
(
mkdir -p ${SCRIPT_DIR}/workload
chakra_converter Text \
    --input="${SCRIPT_DIR:?}"/text_workloads/"${TARGET_WORKLOAD:?}.txt" \
    --output="${SCRIPT_DIR:?}"/workload/"${TARGET_WORKLOAD:?}" \
    --num-npus=32 \
    --num-passes=1
)
