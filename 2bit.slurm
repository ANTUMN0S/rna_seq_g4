#!/usr/bin/env bash

#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=8000
#SBATCH --time=03:00:00
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=michael.berger1@students.unibe.ch

module add SequenceAnalysis/blat/36;

faToTwoBit Rattus_norvegicus.Rnor_6.0.dna.toplevel.fa Rattus_norvegicus.Rnor_6.0.dna.toplevel.2bit
