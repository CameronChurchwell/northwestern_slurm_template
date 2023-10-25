#!/bin/bash
# srun runs the following command on a SLURM compute node
# `--mem 300M` allocates 300MB of ram
# `--cpus-per-task 1` allocates 1 logical CPU core
# 'apptainer build' is the actual command we are running on the compute node
#  this command takes a definition file and creates an image file
# `--force` overwrites an existing image file
# promonet.sif is out output image file
# promonet.def is the input file
srun \
 --mem 300M \
 --cpus-per-task 1 \
 apptainer build \
 --force \
 image.sif \
 image.def