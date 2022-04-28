#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -J coverage
#SBATCH -t 24:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user erkin.alacamli.9670@student.uu.se


module load bioinfo-tools samtools

SAMPLE=(SRR4342129 SRR4342133)

MAP_DIR="/domus/h1/erkinala/Genome_Analysis_Paper3/data/RNA_Map"
OUT_DIR="/domus/h1/erkinala/Genome_Analysis_Paper3/data/Samtools_Coverage"

for x in "${SAMPLE[@]}"
do
MAPS=$MAP_DIR/$x
cd $MAPS
for i in *.bam
do
echo $i
samtools coverage -o $OUT_DIR/$x/${i}_coverage.txt $i
done
done 
