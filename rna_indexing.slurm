#!/usr/bin/env bash

#SBATCH --cpus-per-task=2
#SBATCH --mem-per-cpu=8000
#SBATCH --time=03:00:00
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=michael.berger1@students.unibe.ch

module add UHTS/Aligner/bowtie/1.2.0;

bowtie-build Rnor_r_sno_t_RNA.fa Rnor_r_sno_sn_t_RNA
