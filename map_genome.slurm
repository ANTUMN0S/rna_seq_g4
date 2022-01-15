#!/usr/bin/env bash

#SBATCH --cpus-per-task=10
#SBATCH --mem-per-cpu=8000MB
#SBATCH --time=03:00:00
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=michael.berger1@students.unibe.ch

module add UHTS/Aligner/bowtie/1.2.0;
module add UHTS/Analysis/samtools/1.10;

for x in $(ls -d *RNA.fastq); \
	do echo ${x}; \
	bowtie \
	-S \
	-t \
	-p 4 \
	-v 1 \
	-m 1 \
	--best \
	--strata \
	/data/users/mberger/rna_seq/sra_files/genome/genome \
	-q ${x} \
	2> $(basename ${x} .fastq)_Rnor_6_log.txt | \
	samtools view -h -F 4 -b > $(basename ${x} .fastq)_Rnor_7.2.bam; done
