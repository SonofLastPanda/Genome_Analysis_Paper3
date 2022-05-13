#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -J phylo
#SBATCH -t 24:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user erkin.alacamli.9670@student.uu.se

module load bioinfo-tools phylophlan/0.99 
module unload python
module load biopython/1.73 usearch/5.2.32 muscle/3.8.31 FastTree

outdir="/domus/h1/erkinala/Genome_Analysis_Paper3/data/Phyloplan"
#input=$outdir/input/

#mkdir -p $outdir/input/metagenome
#mkdir -p $outdir/output
#mkdir -p $outdir/data/ppaalns
#ln -sf /sw/apps/bioinfo/phylophlan/0.99/rackham/bin/data/*.bz2 $outdir/data/
#ln -sf /sw/apps/bioinfo/phylophlan/0.99/rackham/bin/data/ppaalns/*.bz2 $outdir/data/ppaalns/
#ln -sf /sw/apps/bioinfo/phylophlan/0.99/rackham/bin/data/ppafull.tax.txt $outdir/data/
#ln -sf /sw/apps/bioinfo/phylophlan/0.99/rackham/bin/taxcuration/ $outdir/taxcuration
cd $outdir


#SAMPLE=(SRR4342129 SRR4342133)


#for i in "${SAMPLE[@]}"
#do
phylophlan.py --nproc 4 -i SRR4342129
#phylophlan.py --nproc 4 -i SRR4342133
#done 
