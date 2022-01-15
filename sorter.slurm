#!/usr/bin/env bash

#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=8000
#SBATCH --time=03:00:00
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=michael.berger1@students.unibe.ch

module add UHTS/Analysis/samtools/1.10;

for x in $(ls -d *.bam); \
	do echo ${x}; \
	samtools sort \
	-@ 4 \
	${x} \
	-o $(basename ${x} .bam)_sorted.bam; done
