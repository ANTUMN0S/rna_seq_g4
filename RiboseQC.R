# In R studio (for example)

# Installation of the package (to be done only once!)
install.packages("devtools")

library("devtools")

install_github(repo = "lcalviell/Ribo-seQC")

###### Analysis part ######

setwd("C:/Users/Antumnos/Desktop/rnaseq")

# Load the package
library("RiboseQC")

# Prepare genome file (to be done only once!!!)
prepare_annotation_files(annotation_directory = ".",
                         twobit_file = "C:/Users/Antumnos/Desktop/Rattus_norvegicus.Rnor_6.0.dna.toplevel.2bit",
                         gtf_file = "C:/Users/Antumnos/Desktop/rnaseq/Rattus_norvegicus.Rnor_6.0.104.gtf",
                         scientific_name = "Rattus.norvegicus",
                         annotation_name = "mRatBN7.2",
                         export_bed_tables_TxDb = F,
                         forge_BSgenome = T,
                         create_TxDb = T)


# Genome mapped sorted-BAM files

genome_bam <- c("C:/Users/Antumnos/Desktop/rnaseq/Neur_Pol_01_clpd_tr.fastq_no_r_sno_sn_t-RNA_Rnor_7.2_sorted.bam",
                "C:/Users/Antumnos/Desktop/rnaseq/Neur_Pol_02_clpd_tr.fastq_no_r_sno_sn_t-RNA_Rnor_7.2_sorted.bam",
                "C:/Users/Antumnos/Desktop/rnaseq/Neur_Pol_03_clpd_tr.fastq_no_r_sno_sn_t-RNA_Rnor_7.2_sorted.bam",
                "C:/Users/Antumnos/Desktop/rnaseq/Som_Pol_01_clpd_tr.fastq_no_r_sno_sn_t-RNA_Rnor_7.2_sorted.bam",
                "C:/Users/Antumnos/Desktop/rnaseq/Som_Pol_02_clpd_tr.fastq_no_r_sno_sn_t-RNA_Rnor_7.2_sorted.bam",
                "C:/Users/Antumnos/Desktop/rnaseq/Som_Poly_03_clpd_tr.fastq_no_r_sno_sn_t-RNA_Rnor_7.2_sorted.bam")

###### QC plots ######

RiboseQC_analysis(annotation_file ="C:/Users/Antumnos/Desktop/rnaseq/Rattus_norvegicus.mRatBN7.2.105.gtf_Rannot",
                  bam_files = genome_bam,
                  fast_mode = T,
                  report_file = "Rnor_Biever_QC.html",
                  sample_names = c("Neuropil_Poly_1", "Neuropil_Poly_2", "Neuropil_Poly_3",
                                   "Somata_Poly_1", "Somata_Poly_2", "Somata_Poly_3"),
                  dest_names = c("Neuropil_Poly_1", "Neuropil_Poly_2", "Neuropil_Poly_3",
                                 "Somata_Poly_1", "Somata_Poly_2", "Somata_Poly_3"),
                  write_tmp_files = F)
