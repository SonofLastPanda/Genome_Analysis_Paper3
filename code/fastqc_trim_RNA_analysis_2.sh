#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 00:30:00
#SBATCH -J FastQC_eval_1
#SBATCH --mail-type=ALL
#SBATCH --mail-user erkin.alacamli.9670@student.uu.se

#load modules
module load bioinfo-tools
module load FastQC

#run fastqc for RNA and DNA

fastqc -o ../data/fastQC_1/RNA_trimmed/ ../data/trimmed_data/RNA_trimmed/*.fastq.gz

