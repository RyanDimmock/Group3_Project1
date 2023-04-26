#!/bin/bash
#SBATCH --job-name=BlastH1418
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=30g
#SBATCH --time=10:00:00
#SBATCH --cpus-per-task=4
#SBATCH --output=/shared/Project1_Resources/Group3/err_out/%.out
#SBATCH --error=/shared/Project1_Resources/Group3/err_out/%.err

# These steps are required to activate Conda
source $HOME/.bash_profile
#conda activate /shared/apps/conda/bio

conda activate /shared/Project1_Resources/Group3/shared_envs/blast_env


blastn -query /shared/Project1_Resources/Group3/assembly/hybrid/S01/assembly.fasta -subject /shared/Project1_Resources/Group3/assembly/hybrid/S04/assembly.fasta -out /shared/Project1_Resources/Group3/H14_comparison_file.txt -outfmt 6

blastn -query /shared/Project1_Resources/Group3/assembly/hybrid/S01/assembly.fasta -subject /shared/Project1_Resources/Group3/assembly/hybrid/S08/assembly.fasta -out /shared/Project1_Resources/Group3/H18_comparison.txt -outfmt 6



