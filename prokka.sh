#!/bin/bash
#SBATCH --job-name=G3_prokka
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --ntasks-per-node=1
#SBATCH --mem=30g
#SBATCH --time=6:00:00
#SBATCH --output=/shared/Project1_Resources/Group3/err_out/%x.out
#SBATCH --error=/shared/Project1_Resources/Group3/err_out/%x.err

# These steps are required to activate Conda
source $HOME/.bash_profile
conda activate /shared/Project1_Resources/Group3/shared_envs/Prokka.new_env

# read in variables from positional paramaters
assembly=$1
out_d=$2
fname=$3

# run the annotation and save in the output directory
prokka --outdir $out_d --prefix $fname $assembly
