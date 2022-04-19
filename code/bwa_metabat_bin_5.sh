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
module load MetaBat
module load samtools

DATADIR="../data/raw_data/DNA_trimmed"
INDEXDIR="../data/assembled_seq/DNA_assemble"
OUTDIR="../data/Metabat_bins"
DIR=(SRR4342133 SRR4342129)

for x in "${DIR[@]}"
do

PAIR1=$DATADIR/${x}_1.paired.trimmed.fastq.gz
PAIR2=$DATADIR/${x}_2.paired.trimmed.fastq.gz
OUTPATH=$OUTDIR/$x
INDEX=$INDEXDIR/$x/final.contigs.fa
bwa index $INDEX
bwa mem -t 2 $INDEX $PAIR1 $PAIR2 | samtools sort -@ 2 -o $OUTPATH/depth.bam 
jgi_summarize_bam_contig_depths --outputDepth $OUTPATH/depth.txt --pairedContigs $OUTPATH/paired.txt $OUTPATH/depth.bam

metabat -i $INDEXDIR/$x/final.contigs.fa -a $OUTPATH/depth.txt -p $OUTPATH/paired.txt -o $OUTPATH/$x --specific -l -v --saveTNF $OUTPATH/saved.tnf --saveDistance $OUTPATH/saved.gprob

done

 
