#!/usr/bin/env bash

#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=4000
#SBATCH --time=02:00:00
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=michael.berger1@students.unibe.ch

module add UHTS/Analysis/sratoolkit/2.10.7

# concatenate all files into a single file to fetch them
echo "SRR9596295" > SRA_files.txt
echo "SRR9596296" >> SRA_files.txt
echo "SRR9596300" >> SRA_files.txt
echo "SRR9596310" >> SRA_files.txt
echo "SRR9596303" >> SRA_files.txt
echo "SRR9596304" >> SRA_files.txt

# fetch the files
prefetch --option-file SRA_files.txt

# move the files into a single directory
mkdir SRA_fetched
mv ./SRR9596295/SRR9596295.sra ./SRA_fetched/
mv ./SRR9596296/SRR9596296.sra ./SRA_fetched/
mv ./SRR9596300/SRR9596300.sra ./SRA_fetched/
mv ./SRR9596303/SRR9596303.sra ./SRA_fetched/
mv ./SRR9596304/SRR9596304.sra ./SRA_fetched/
mv ./SRR9596310/SRR9596310.sra ./SRA_fetched/

# remove the old directories
rm -r SRR*

