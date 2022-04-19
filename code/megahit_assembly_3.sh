#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 12:00:00
#SBATCH -J mega_assembly
#SBATCH --mail-type=ALL
#SBATCH --mail-user erkin.alacamli.9670@student.uu.se

#Load modules
module load bioinfo-tools
module load megahit

#Data and output directories.
DATA="../data/raw_data/DNA_trimmed/"
OUTDIR="../data/assembled_seq/DNA_assemble"

#Megahit with paper parameters
megahit --k-min 65 --k-max 105 --k-step 10 -1  $DATA/SRR4342129_1.paired.trimmed.fastq.gz -2 $DATA/SRR4342129_2.paired.trimmed.fastq.gz -t 2 -o $OUTDIR/SRR4342129 

megahit --k-min 65 --k-max 105 --k-step 10 -1 $DATA/SRR4342133_1.paired.trimmed.fastq.gz -2 $DATA/SRR4342133_2.paired.trimmed.fastq.gz  -t 2  -o $OUTDIR/SRR4342133 
