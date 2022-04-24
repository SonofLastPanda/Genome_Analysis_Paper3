#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -J eggnog
#SBATCH -t 5-00:00:00
#SBATCH --mail-type ALL
#SBATCH --mail-user erkin.alacamli.9670@student.uu.se

module load bioinfo-tools
module load eggNOG-mapper

INPUTDIR="/domus/h1/erkinala/Genome_Analysis_Paper3/data/Metabat_bins"
OUTPUTDIR="/proj/genomeanalysis2022/nobackup/work/erkinala/Func_Ann"
DIR=(SRR4342129 SRR4342133)

#for x in "${DIR_DATA[@]}"
#do
cd $INPUTDIR/SRR4342129/SRR4342129
for f in *
do
echo $f
emapper.py --itype metagenome --cpu 4  -i $f -o $f --output_dir $OUTPUTDIR/SRR4342129

done
#done

cd $INPUTDIR/SRR4342133/SRR4342133
#cd $INPUT
for f in *
do
echo $f
emapper.py --itype metagenome --cpu 4  -i $f -o $f --output_dir $OUTPUTDIR/SRR4342133
done
