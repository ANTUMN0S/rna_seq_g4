#!/bin/env bash

#SBATCH --cpus-per-task=2
#SBATCH --mem-per-cpu=4000
#SBATCH --time=03:00:00
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=michael.berger1@students.unibe.ch

module add UHTS/Analysis/sratoolkit/2.10.7	

fastq-dump --gzip SRR*.sra
