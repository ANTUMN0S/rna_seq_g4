#!/usr/bin/env bash

#SBATCH --cpus-per-task=10
#SBATCH --mem-per-cpu=8000
#SBATCH --time=12:00:00
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=michael.berger1@students.unibe.ch#SBATCH --cpus-per-task=1


module add UHTS/Quality_control/cutadapt/2.5;

# Clip 3' adapter and 2 nt from the 5' end
for x in $(ls -d *.fastq.gz); do echo ${x}; \
	cutadapt \
	-j 12 \
	-a AGATCGGAAGAGCACACGTCTGAA \
	-q 25 \
	--cut 2 \
	--minimum-length 22 \
	--discard-untrimmed \
	--overlap 3 \
	-e 0.2 \
	-o $(basename ${x} .fastq.gz)_clpd.fastq.gz \
	${x} 1> $(basename ${x} .fastq.gz)_clpd_log.txt; done


# Trim 10 nt (5 nt randomized bases + 5 nt Barcode) from the 3' end
for x in $(ls -d *_clpd.fastq.gz); do echo ${x}; \
	cutadapt \
	-j 12 \
	-q 25 \
	--cut -10 \
	--minimum-length 22 \
	-o $(basename ${x} .fastq.gz)_tr.fastq.gz \
	${x} 1> $(basename ${x} .fastq.gz)_tr_log.txt; done
