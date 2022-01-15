#!/usr/bin/env bash

#SBATCH --cpus-per-task=2
#SBATCH --mem-per-cpu=2000
#SBATCH --time=01:30:00
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=michael.berger1@students.unibe.ch

module add UHTS/Quality_control/fastqc/0.11.9

# fastqc output will be put into a seperate directory
mkdir fast_qc_output
fastqc -o ./fast_qc_output -f fastq *.fastq.gz
