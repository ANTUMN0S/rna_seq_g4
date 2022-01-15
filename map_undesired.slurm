#!/usr/bin/env bash

#SBATCH --cpus-per-task=10
#SBATCH --mem-per-cpu=10000
#SBATCH --time=03:00:00
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=michael.berger1@students.unibe.ch
	
module add UHTS/Aligner/bowtie/1.2.0;

for x in $(ls -d *tr.fastq); \
	do echo ${x}; \
	bowtie \
	-S \
	-t \
	-p 4 \
	../undesired_rna/Rnor_r_sno_sn_t_RNA ${x} \
	--un $(basename ${x} .fastq.gz)_no_r_sno_sn_t-RNA.fastq \
	2> $(basename ${x} .fastq.gz)_no_r_sno_sn_t-RNA_log.txt > /dev/null; done
