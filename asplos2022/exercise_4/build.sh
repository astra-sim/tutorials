#!/bin/bash
set -e

SCRIPT_DIR="$(dirname "$(realpath $0)")"
BUILD_DIR="${SCRIPT_DIR}/../build"
ANALYTICAL_DIR="${SCRIPT_DIR}/../astra-sim/build/astra_analytical"

# Setup
cd astra-sim/
git clean -xdf .
git checkout .
cd ..
cp -r ./exercise_4/astra-sim/ astra-sim/
rm -rf ${BUILD_DIR}
mkdir -p ${BUILD_DIR}

# Build
cd ${BUILD_DIR}
cmake ${ANALYTICAL_DIR}
make
