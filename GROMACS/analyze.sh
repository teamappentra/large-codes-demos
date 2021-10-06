#!/bin/bash -e
# Runs pwreport for the whole GROMACS project

# Check requirements: pwreport and the compile_commands.json file
for cmd in time pwreport; do
    command -v $cmd >/dev/null 2>&1 || { echo >&2 "$cmd is required but wasn't found. Aborting."; exit 1; }
done

COMPILE_COMMANDS_PATH="build/compile_commands.json"
if [ ! -f $COMPILE_COMMANDS_PATH ]; then
    echo "$COMPILE_COMMANDS_PATH not found, please run 'setup.sh' first. Aborting."; exit 1;
fi

set -x

time \
pwreport --summary src/src \
--config pwa.json \
--show-progress \
--show-failures \
--exclude src/src/external \
--exclude src/src/programs \
--exclude src/src/api/cpp/tests/context.cpp \
--exclude src/src/gromacs/mdlib/leapfrog_gpu_sycl.cpp \
--exclude src/src/gromacs/fft/fft_mkl.cpp \
--exclude src/src/gromacs/fft/fft_fftw3.cpp \
--exclude src/src/gromacs/gmxana/tests/gmx_make_ndx.cpp \
--exclude src/src/gromacs/ewald/pme_spline_work.cpp \
--exclude src/src/gromacs/nbnxm/opencl \
--exclude src/src/gromacs/hardware/device_management_ocl.cpp \
--exclude src/src/gromacs/hardware/device_management_sycl.cpp \
--exclude src/src/gromacs/gpu_utils/ocl_compiler.cpp \
--exclude src/src/gromacs/gpu_utils/devicebuffer_sycl.cpp \
--exclude src/src/gromacs/gpu_utils/ocl_caching.cpp \
--exclude src/src/gromacs/gpu_utils/device_context_sycl.cpp \
--exclude src/src/gromacs/gpu_utils/device_stream_ocl.cpp \
--exclude src/src/gromacs/gpu_utils/tests/devicetransfers_ocl.cpp \
--exclude src/src/gromacs/gpu_utils/tests/devicetransfers_sycl.cpp \
--exclude src/src/gromacs/gpu_utils/tests/typecasts_runner.cpp \
--exclude src/src/gromacs/gpu_utils/oclutils.cpp \
--exclude src/src/gromacs/ewald/pme_gpu.cpp \
--exclude src/src/gromacs/ewald/pme_gpu_internal.cpp \
--exclude src/src/gromacs/ewald/pme_gpu_program_impl_ocl.cpp
