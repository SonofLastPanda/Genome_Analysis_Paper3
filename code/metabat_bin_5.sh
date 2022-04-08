#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 2:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user erkin.alacamli.9670@student.uu.se

module load bioinfo-tools
module load MetaBat

DATADIR="../data/assembled_seq/DNA_assemble"
OUTDIR="../data/Metabat_bins"

metabat -i $DATADIR/SRR4342129/final.contigs.fa 
