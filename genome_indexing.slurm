#!/usr/bin/env bash

#SBATCH --cpus-per-task=10
#SBATCH --mem-per-cpu=10000
#SBATCH --time=24:00:00
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=michael.berger1@students.unibe.ch

module add UHTS/Aligner/bowtie/1.2.0;

gunzip Rattus_norvegicus.Rnor_6.0.dna.toplevel.fa.gz

bowtie-build Rattus_norvegicus.Rnor_6.0.dna.toplevel.fa Rattus_norvegicus.Rnor_6.0.dna.toplevelgg


