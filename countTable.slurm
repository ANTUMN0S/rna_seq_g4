#!/usr/bin/env bash

#SBATCH --cpus-per-task=10
#SBATCH --mem-per-cpu=10000
#SBATCH --time=24:00:00
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=michael.berger1@students.unibe.ch

module add UHTS/Analysis/subread/2.0.1;

# Count reads on CDS

featureCounts -T 4 -t CDS -g gene_id -a ../genome/Rattus_norvegicus.Rnor_6.0.104.gtf.gz -o CDS_counts_rawfile.txt *_sorted.bam

# Extract GeneID and Sample columns
cut -f 1,7-12 CDS_counts_rawfile.txt > CDS_counts_processed.txt
