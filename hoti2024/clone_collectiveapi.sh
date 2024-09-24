#!/bin/bash
set -e

# Path
SCRIPT_DIR=$(dirname "$(realpath $0)")

# Clone MSCCLang-tools
(
git clone git@github.com:astra-sim/collectiveapi.git
cd ${SCRIPT_DIR}/collectiveapi
git submodule update --init
)

