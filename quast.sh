#!/bin/bash
#SBATCH --job-name=G3_quast
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
conda activate /shared/Project1_Resources/Group3/shared_envs/quast_env

# change to the assembly directory
cd /shared/Project1_Resources/Group3/assembly/

# run quast
quast.py ./finalassembly_all/S01_shortassembly.fasta \
./finalassembly_all/S04_shortassembly.fasta \
./finalassembly_all/S08_shortassembly.fasta \
./finalassembly_all/S01_longassembly.fasta \
./finalassembly_all/S04_longassembly.fasta \
./finalassembly_all/S08_longassembly.fasta \
./finalassembly_all/S01_hybridassembly.fasta \
./finalassembly_all/S04_hybridassembly.fasta \
./finalassembly_all/S08_hybridassembly.fasta \
-r ./reference/H_volcanii_ref.fna.gz \
-o ./quast/

