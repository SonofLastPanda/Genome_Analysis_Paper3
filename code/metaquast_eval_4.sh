#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -J megaquast
#SBATCH --mail-type=ALL
#SBATCH --mail-user erkin.alacamli.9670@student.uu.se
#SBATCH -t 2:00:00

module load bioinfo-tools
module load quast

#MetaQuast DNA assembly evaluation

DATADIR="../data/assembled_seq/DNA_assemble"
OUTDIR="../data/MetaQuast_Eval"

metaquast.py $DATADIR/SRR4342129/final.contigs.fa -o $OUTDIR/SRR4342129
metaquast.py $DATADIR/SRR4342133/final.contigs.fa -o $OUTDIR/SRR4342133
