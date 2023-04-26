#!/bin/bash
#SBATCH --job-name=G3_assembly_hybrid
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --time=96:00:00
#SBATCH --cpus-per-task=8
#SBATCH --ntasks-per-node=1
#SBATCH --mem=30g
#SBATCH --output=/shared/Project1_Resources/Group3/err_out/%x.out
#SBATCH --error=/shared/Project1_Resources/Group3/err_out/%x.err

# These steps are required to activate Conda
source $HOME/.bash_profile
conda activate /shared/Project1_Resources/Group3/unicycpy37_env


# Check the number of input files and output directory given as command line arguments
if [ $# -eq 2 ]
then
    long=$1
    out_directory=$2
    unicycler --kmers 25,37,59 -1 $long -o $out_directory
elif [ $# -eq 3 ]
then
    short1=$1
    short2=$2
    out_directory=$3
    unicycler --kmers 25,37,59 -1 $short1 -2 $short2 -o $out_directory
elif [ $# -eq 4 ]
then
    short1=$1
    short2=$2
    long=$3
    out_directory=$4
    unicycler --kmers 25,37,59 -1 $short1 -2 $short2 -l $long -o $out_directory
else
    echo "ERROR: Incorrect number of input files. /nPlease provide either 1 <long>, 2 <short1> <short2> or 3 <short1> <short2> <long> fastq files for assembly followed by an output directory. /nIf a directory by that name does not exit, a new one will be created"
    exit 1
fi
