#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 5:00:00
#SBATCH -J checkm
#SBATCH --mail-type=ALL
#SBATCH --mail-user erkin.alacamli.9670@student.uu.se

#module load bioinfo-tools
#module load CheckM

DIR_DATA=(SRR4342129 SRR4342133)
BINDIR="../data/Metabat_bins"
Check_DIR="../data"



cd $Check_DIR
mkdir CheckM_data
cd CheckM_data
module load bioinfo-tools CheckM/1.1.3
cp -av $CHECKM_DATA/checkm_data_2015_01_16.tar.gz .
mkdir 2015_01_16
cd 2015_01_16
tar xzf ../checkm_data_2015_01_16.tar.gz

checkm data setRoot $PWD
for x in "${DIR_DATA[@]}"
do
DATADIR=$BINDIR/$x/$x/
#analysis

checkm lineage_wf -t 4 -x fa --reduced_tree $DATADIR $Check_DIR/CheckM_data/$x

done

