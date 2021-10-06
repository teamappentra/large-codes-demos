#!/bin/bash -e
# Sets up the required files for the analysis:
# 1. Check out the GROMACS submodule
# 2. Generate the compile_commands.json using CMake

# Check that all required commands are available
for cmd in git cmake; do
    command -v $cmd >/dev/null 2>&1 || { echo >&2 "$cmd is required but wasn't found. Aborting."; exit 1; }
done

if [ -d "build" ]; then
    echo "'build' directory already exists, please delete it. Aborting."; exit 1;
fi

set -x

git submodule update --init --recursive
mkdir build && cd build
cmake ../src -DGMX_FFT_LIBRARY=fftpack -DCMAKE_EXPORT_COMPILE_COMMANDS=ON

set +x

# Run sloccount if available
if command -v sloccount >/dev/null 2>&1; then
    printf "\n"
    sloccount --filecount ../src/src/
fi
