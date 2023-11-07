#!/bin/bash

# This part of the script was written by ChatGPT 3.5!
#  Which is nice because I don't know how to shell script and don't care to learn :)

# Prompt the user for IMAGE_NAME with a default value
read -p "Enter IMAGE_NAME (default: image): " image_name
image_name=${image_name:-image}

# Prompt the user for CONDA_ENV_NAME with a default value
read -p "Enter CONDA_ENV_NAME (default: my_environment): " conda_env_name
conda_env_name=${conda_env_name:-my_environment}

# Display the entered or default values
echo "IMAGE_NAME: $image_name"
echo "CONDA_ENV_NAME: $conda_env_name"

# End ChatGPT

echo "Starting image build on compute node"

# srun runs the following command on a SLURM compute node
# `--mem 300M` allocates 300MB of ram
# `--cpus-per-task 2` allocates 2 logical CPU cores
# 'apptainer build' is the actual command we are running on the compute node
#  this command takes a definition file and creates an image file
# `--force` overwrites an existing image file
# $image_name.sif is out output image file
# $image_name.def is the input file
srun \
 --mem 1G \
 --cpus-per-task 2 \
 apptainer build \
 --force \
 --build-arg "CONDA_ENV_NAME=$conda_env_name" \
 "$image_name.sif" \
 "$image_name.def"