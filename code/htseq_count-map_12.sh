#!/bin/bash -l 
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -J count_gene
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 24:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user erkin.alacamli.9670@student.uu.se

module load bioinfo-tools htseq

gff_dir="/home/erkinala/Genome_Analysis_Paper3/data/Prokka_Ann"
input_dir="/crex/proj/genomeanalysis2022/nobackup/work/erkinala/RNA_Map"
SAMPLES=(SRR4342129 SRR4342133)

for i in "${SAMPLES[@]}"
do
cd $input_dir/$i
for x in *.bam
do
sample_num=${x%????????????????????}
num=${sample_num#*.}
#echo $num
mkdir ${x}_out
htseq-count -f bam $x $gff_dir/SRR4342129/SRR4342129_${num}_ann.out/PROKKA_04212022_trimmed.gff -o ${x}_out/htseq_count.sam
done
done
