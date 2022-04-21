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

BIN_DIR="../data/Metabat_bins"
OUTDIR="../data/Prokka_Ann"
DIRS=(SRR4342129 SRR4342133)

for x in "${DIRS[@]}"
do
i=1
DATADIR=$BIN_DIR/$x/$x
	for bin in $DATADIR/*
	do
	prokka --metagenome --cpus 2 $bin --outdir $OUTDIR/$x/SRR4342129_${i}_ann.out
	i=$((i+1))
	done
done
