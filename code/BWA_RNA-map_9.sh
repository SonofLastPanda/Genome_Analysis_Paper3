#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -J RNA_Map
#SBATCH -t 24:00:00
#SBATCH --mail-type ALL
#SBATCH --mail-user erkin.alacamli.9670@student.uu.se

module load bioinfo-tools bwa samtools


BIN_DIR="/domus/h1/erkinala/Genome_Analysis_Paper3/data/Metabat_bins"
RNA_DIR="/domus/h1/erkinala/Genome_Analysis_Paper3/data/trimmed_data/RNA_trimmed"
OUT_DIR="/domus/h1/erkinala/Genome_Analysis_Paper3/data/RNA_Map"

SAMPLE=(SRR4342129 SRR4342133)

for x in "${SAMPLE[@]}"
do
BINS=$BIN_DIR/$x/$x
cd $BINS
#cd $BIN_DIR/SRR4342133/SRR4342133
for i in *.fa
do
bwa index $i
if [[ "$x" == SRR4342129 ]];
then
bwa mem -t 2 $i $RNA_DIR/SRR4342137_left_paired_trim.fastq.gz $RNA_DIR/SRR4342137_right_paired_trim.fastq.gz | samtools sort -@ 2 > $OUT_DIR/$x/${i}_RNA_Map_sort.bam

else
bwa mem -t 2 $i $RNA_DIR/SRR4342139_left_paired_trim.fastq.gz $RNA_DIR/SRR4342139_right_paired_trim.fastq.gz | samtools sort -@ 2 > $OUT_DIR/$x/${i}_RNA_Map_sort.bam
fi

done
done
