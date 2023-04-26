#!/bin/bash
#SBATCH --job-name=Group3_merge
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=1g
#SBATCH --time=02:00:00
#SBATCH --output=/shared/Project1_Resources/Group3/0andE/%x.out
#SBATCH --error=/shared/Project1_Resources/Group3/0andE/%x.err


cd /shared/Project1_Resources/source_data/ds989matt/20211022_045448/Fastq
# concatenate illumina data
cat H*_S1_L00?_R1_001.fastq.gz > /shared/Project1_Resources/Group3/H164_S1_R1.fastq.gz
cat H*_S1_L00?_R2_001.fastq.gz > /shared/Project1_Resources/Group3/H164_S1_R2.fastq.gz
cat H*_S4_L00?_R1_001.fastq.gz > /shared/Project1_Resources/Group3/H3932_S4_R1.fastq.gz
cat H*_S4_L00?_R2_001.fastq.gz > /shared/Project1_Resources/Group3/H3932_S4_R2.fastq.gz
cat H*_S8_L00?_R1_001.fastq.gz > /shared/Project1_Resources/Group3/H5303_S8_R1.fastq.gz
cat H*_S8_L00?_R2_001.fastq.gz > /shared/Project1_Resources/Group3/H5303_S8_R2.fastq.gz

cd /shared/Project1_Resources/source_data/ds989matt/ds989/DS989_1_M1/20211124_1546_X3_FAQ09231_45399ec3
# concatenate nanopore data
cat ./fastq_pass/barcode01/*.fastq.gz > /shared/Project1_Resources/Group3/barcode01pass.fastq.gz
cat ./fastq_pass/barcode04/*.fastq.gz > /shared/Project1_Resources/Group3/barcode04pass.fastq.gz
cat ./fastq_pass/barcode08/*.fastq.gz > /shared/Project1_Resources/Group3/barcode08pass.fastq.gz
cat ./fastq_fail/barcode01/*.fastq.gz > /shared/Project1_Resources/Group3/barcode01fail.fastq.gz
cat ./fastq_fail/barcode04/*.fastq.gz > /shared/Project1_Resources/Group3/barcode04fail.fastq.gz
cat ./fastq_fail/barcode08/*.fastq.gz > /shared/Project1_Resources/Group3/barcode08fail.fastq.gz
