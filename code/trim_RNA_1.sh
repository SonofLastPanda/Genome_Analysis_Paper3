#!/bin/bash -l 
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -J RNA_trim
#SBATCH -t 00:40:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user erkin.alacamli.9670@student.uu.se
 
module load bioinfo-tools
module load trimmomatic

DATA="../data/raw_data/RNA_untrimmed/"
OUT="../data/trimmed_data/RNA_trimmed"

trimmomatic PE -threads 2 -phred33  -trimlog ../data/trimmed_data/log/trim_RNA_SRR4342137.log $DATA/SRR4342137.1.fastq.gz $DATA/SRR4342137.2.fastq.gz $OUT/SRR4342137_left_paired_trim.fastq.gz $OUT/SRR4342137_left_unpaired_trim.fastq.gz $OUT/SRR4342137_right_paired_trim.fastq.gz $OUT/SRR4342137_right_unpaired_trim.fastq.gz ILLUMINACLIP:/sw/apps/bioinfo/trimmomatic/0.36/milou/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36 

trimmomatic PE -threads 2 -phred33 -trimlog ../data/trimmed_data/log/trim_RNA_SRR4342193.log $DATA/SRR4342139.1.fastq.gz $DATA/SRR4342139.2.fastq.gz $OUT/SRR4342139_left_paired_trim.fastq.gz $OUT/SRR4342139_left_unpaired_trim.fastq.gz  $OUT/SRR4342137_right_paired_trim.fastq.gz  $OUT/SRR4342139_right_unpaired_trim.fastq.gz ILLUMINACLIP:/sw/apps/bioinfo/trimmomatic/0.36/milou/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
