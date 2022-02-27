#!/bin/bash
set -e

SCRIPT_DIR="$(dirname "$(realpath $0)")"
BUILD_DIR="${SCRIPT_DIR}/../build"
ANALYTICAL_DIR="${SCRIPT_DIR}/../astra-sim/build/astra_analytical"

# Setup
cd "${SCRIPT_DIR}/../astra-sim/"
git clean -xdf .
git checkout .
cp -r "${SCRIPT_DIR}/astra-sim/" "${SCRIPT_DIR}/../astra-sim/"
rm -rf ${BUILD_DIR}
mkdir -p ${BUILD_DIR}

# Build
cd ${BUILD_DIR}
cmake ${ANALYTICAL_DIR}
make
