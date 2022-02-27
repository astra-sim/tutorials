#!/bin/bash
set -e

SCRIPT_DIR=$(dirname "$(realpath $0)")
ASTRASIM_DIR="${SCRIPT_DIR}/../astra-sim"

# 1. Cleanup configs
rm -rf ${ASTRASIM_DIR}/inputs/

# 2. Copy Exercise 0 configs
cp -r ./inputs ${ASTRASIM_DIR}
