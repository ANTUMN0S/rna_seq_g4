#!/usr/bin/env bash

#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=4000
#SBATCH --time=01:30:00
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=michael.berger1@students.unibe.ch

module add UHTS/Quality_control/fastqc/0.11.9

# the fastqc output will be in a seperate directory
mkdir fastqc_output
fastqc -o ./fastqc_output -f fastq *.fastq.gz
