#!/usr/bin/env bash

#SBATCH --cpus-per-task=10
#SBATCH --mem-per-cpu=10000
#SBATCH --time=24:00:00
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=michael.berger1@students.unibe.ch

module add UHTS/Analysis/subread/2.0.1;


# Extract reads mapped to different biotypes

featureCounts -T 4 -t exon -g gene_biotype -a ../genome/Rattus_norvegicus.Rnor_6.0.104.gtf.gz -o biotype_counts_rawfile.txt *_sorted.bam

# Extract Biotype and Sample columns

cut -f 1,7-12 biotype_counts_rawfile.txt > biotype_counts_processed.txt