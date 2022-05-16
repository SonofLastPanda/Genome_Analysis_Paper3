#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -J prokka
#SBATCH -t 5:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user erkin.alacamli.9670@student.uu.se

module load bioinfo-tools prokka

BIN_DIR="/home/erkinala/Genome_Analysis_Paper3/data/Metabat_bins"
OUTDIR="/home/erkinala/Genome_Analysis_Paper3/data/Prokka_Ann"
DIRS=(SRR4342129 SRR4342133)

for x in "${DIRS[@]}"
do

DATADIR=$BIN_DIR/$x/$x
cd $DATADIR
for bin in *
do
echo $bin
sample_num=${bin%???}
num=${sample_num#*.}
echo $num
prokka --metagenome --cpus 2 $bin --outdir $OUTDIR/$x/${bin}_ann.out --prefix $bin
done
done
