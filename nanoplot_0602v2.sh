#!/bin/bash
#SBATCH --job-name=Group_3_nanoplot0602v2
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=30g
#SBATCH --time=12:00:00
#SBATCH --cpus-per-task=8
#SBATCH --output=/shared/Project1_Resources/Group3/%x.out
#SBATCH --error=/shared/Project1_Resources/Group3/nanoplot_err.err

# These steps are required to activate Conda
source $HOME/.bash_profile
conda activate /shared/home/mbxrd1/miniconda3/envs/nanoplot13_env

# assembly nanoplot

cd /shared/Project1_Resources/Group3/Nanopore

NanoPlot --fastq barcode01pass.fastq.gz -o /shared/Project1_Resources/Group3/nanoplot_0602/01
NanoPlot --fastq barcode04pass.fastq.gz -o /shared/Project1_Resources/Group3/nanoplot_0602/04
NanoPlot --fastq barcode08pass.fastq.gz -o /shared/Project1_Resources/Group3/nanoplot_0602/08

