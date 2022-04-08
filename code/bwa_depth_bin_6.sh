#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 12:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user erkin.alacamli.9670@student.uu.se

module load bioinfo-tools
module load bwa
module load samtools

DATADIR="../data/raw_data/DNA_trimmed"
INDEXDIR="../data/assembled_seq/DNA_assemble"
OUTDIR="../data/Metabat_bins"
DIR=(SRR4342133 SRR4342129)

for x in $DIR
do

PAIR1=$DATADIR/${x}_1.paired.trimmed.fastq.gz
PAIR2=$DATADIR/${x}_2.paired.trimmed.fastq.gz

bwa index $INDEXDIR/$x/final.contigs.fa
bwa mem -t 2 $INDEXDIR/$x/final.contigs.fa $PAIR1 $PAIR2 | samtools sort -o $OUTDIR/$x/depth.bam -@ 2
done

 
