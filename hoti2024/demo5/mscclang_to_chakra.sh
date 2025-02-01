#!/bin/bash
set -e

# Path
SCRIPT_DIR=$(dirname "$(realpath $0)")

# MSCCLang -> MSCCL-IR (XML)
python3 ${SCRIPT_DIR}/../collectiveapi/msccl-tools/examples/mscclang/allreduce_a100_ring.py 8 1 1 > inputs/custom_allreduce_ring.xml \

# MSCCL-IR -> Chakra
cd ${SCRIPT_DIR}/../collectiveapi/chakra_converter/
python3 et_converter.py \
	--input_type msccl \
	--input_filename ../../demo5/inputs/custom_allreduce_ring.xml \
	--output_filename ../../demo5/inputs/custom_ring
