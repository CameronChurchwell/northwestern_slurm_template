#!/bin/bash
# `apptainer run` executes the following command in an apptainer session
# `--writable-tmpfs` creates a writable temproary filesystem on top of the static image
#   This was in an earlier version, but is no longer needed for this
#  to allow some tools which cache information to work properly
# `--nv` passes through NVidia drivers for GPU access
# `promonet.sif` is our image file
# `$*` substitutes all arguments to this script, which will include first the command
#  we want ot run in our image, and then the arguments for that command.
apptainer run \
 --nv \
 image.sif \
 $*
