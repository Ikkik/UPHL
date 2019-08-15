#!/bin/bash

sample=$1
threads=$2
outfile=$3
input=$4

genome_size=("Acinetobacter_baumanii:4.34"
"Acinetobacter_baumannii:4.34"
"Acinetobacter_calcoaceticus:3.92966"
"Acinetobacter_guillouiae:4.84896"
"Acinetobacter_nosocomialis:3.90796"
"Acinetobacter_pittii:3.99363"
"Acinetobacter_schindleri:3.24409"
"Acinetobacter_sp:3.59776"
"Alistipes_indistinctus:2.89473"
"Aquamicrobium_sp:6.04"
"Bacteroides_dorei:5.57186"
"Bacteroides_fragilis:5.28156"
"Bacteroides_ovatus:6.71678"
"Bacteroides_sp:4.48109"
"Bacteroides_uniformis:4.66442"
"Bacteroides_vulgatus:5.05011"
"Bacteroides_xylanisolvens:6.05981"
"Bison_bison:2828.03"
"Bos_mutus:2645.16"
"Bos_taurus:2715.85"
"Burkholderia_ambifaria:7.59495"
"Burkholderia_cenocepacia:7.95977"
"Burkholderia_cepacia:8.48447"
"Burkholderia_lata:8.51556"
"Burkholderia_pyrrocinia:7.9645"
"Burkholderia_sp:7.49709"
"Burkholderia_vietnamiensis:6.82485"
#Campylobacter_coli:1.75264"
#Campylobacter_fetus:1.81856"
#Campylobacter_hyointestinalis:1.77666"
#Campylobacter_jejuni:1.70046"
#Campylobacter_lari:1.52905"
#Campylobacter_peloridis:1.76279"
#Campylobacter_subantarcticus:1.81777"
#Campylobacter_upsaliensis:1.68579"
"Campylobacter_coli:1.6"
"Campylobacter_fetus:1.6"
"Campylobacter_hyointestinalis:1.6"
"Campylobacter_jejuni:1.6"
"Campylobacter_lari:1.6"
"Campylobacter_peloridis:1.6"
"Campylobacter_subantarcticus:1.6"
"Campylobacter_upsaliensis:1.6"
"Citrobacter_amalonaticus:5.05907"
"Citrobacter_farmeri:5.02625"
"Citrobacter_freundii:5.30103"
"Citrobacter_sp:5.04059"
"Citrobacter_werkmanii:5.07704"
"Citrobacter_youngae:4.94516"
"Clostridium_botulinum:3.9176"
"Clostridium_perfringens:3.44969"
"Clostridium_sporogenes:4.09729"
"Cronobacter_dublinensis:4.54555"
"Cronobacter_malonaticus:4.46923"
"Cronobacter_muytjensii:4.35449"
"Cronobacter_sakazakii:4.48337"
"Cronobacter_turicensis:4.54851"
"Cronobacter_universalis:4.43689"
"Eggerthella_lenta:3.54185"
"Eggerthella_sp:1.76818"
"Enterobacter_aerogenes:5.27036"
"Enterobacter_asburiae:4.85197"
"Enterobacter_cancerogenus:4.87994"
"Enterobacter_cloacae:4.94628"
"Enterobacter_hormaechei:4.96197"
"Enterobacteriaceae_bacterium:3.66379"
"Enterobacter_ludwigii:4.9068"
"Enterobacter_mori:4.96017"
"Enterobacter_sp:4.94003"
"Enterococcus_faecalis:2.96401"
"Enterococcus_faecium:2.92455"
"Escherichia_albertii:4.77571"
#Escherichia_coli:5.13944"
"Escherichia_coli:5.0"
"Escherichia_fergusonii:4.77002"
"Escherichia_sp:4.80983"
"Haemophilus_aegyptius:1.94488"
"Haemophilus_haemolyticus:1.91258"
"Haemophilus_influenzae:1.84705"
"Haemophilus_parainfluenzae:2.07414"
"Haemophilus_sp:1.96147"
"Hafnia_alvei:4.71272"
"Hafnia_paralvei:4.73395"
"Helicobacter_pullorum:1.8091"
"Klebsiella_michiganensis:6.19046"
"Klebsiella_oxytoca:6.03314"
"Klebsiella_pneumoniae:5.58614"
"Klebsiella_sp:5.44138"
"Klebsiella_variicola:5.6733"
"Legionella_pneumophila:3.44562"
"Lelliottia_amnigena:4.47144"
#Listeria_innocua:2.91057"
#Listeria_monocytogenes:3.00741"
"Listeria_innocua:3.0"
"Listeria_monocytogenes:3.0"
"Morganella_morganii:3.9622"
"Morganella_sp:3.94136"
"Mumia_flava:4.40247"
"Pantoea_ananatis:4.86928"
"Pantoea_sp:4.49278"
"Parabacteroides_distasonis:5.10822"
"Parabacteroides_merdae:4.53044"
"Parabacteroides_sp:5.15132"
"Providencia_stuartii:4.42484"
"Pseudomonas_aeruginosa:6.59212"
"Pseudomonas_otitidis:6.23479"
"Pseudomonas_sp:5.99502"
"Ralstonia_pickettii:5.28777"
"Ralstonia_sp:5.31026"
"Salmonella_bongori:4.42541"
#Salmonella_enterica:4.77696"
"Salmonella_enterica:5.0"
"Serratia_marcescens:5.19111"
"Serratia_nematodiphila:5.19153"
"Serratia_sp:5.30832"
#Shigella_boydii:4.68023"
#Shigella_dysenteriae:4.59614"
#Shigella_flexneri:4.55183"
#Shigella_sonnei:4.66116"
"Shigella_boydii:5.0"
"Shigella_dysenteriae:5.0"
"Shigella_flexneri:5.0"
"Shigella_sonnei:5.0"
"Staphylococcus_aureus:2.83753"
"Sutterella_wadsworthensis:2.63323"
"Variovorax_paradoxus:7.51589"
"Variovorax_sp:6.8591"
"Vibrio_albensis:4.0229"
"Vibrio_cholerae:4.0229"
"Vibrio_mimicus:4.34797"
"Vibrio_navarrensis:4.2485"
"Vibrio_parahaemolyticus:5.12307"
"Vibrio_Parahaemolyticus:5.12307"
"Vibrio_sp:5.02897"
"Vibrio_vulnificus:4.97039" )


mash_result=($(head -n 1 mash/$sample*sorted.txt | cut -f 1 | cut -f 8 -d "-" | sed 's/^_\(.*\)/\1/' | cut -f 1,2 -d "_" | cut -f 1 -d "." ))
genome_length=$(history -p ${genome_size[@]} | grep $mash_result | cut -f 2 -d ":" | parallel "echo {}*1000000" | bc | cut -f 1 -d "." )
if [ -z $genome_length ] ; then genome_length=$(grep 'Total length (>= 0 bp)' quast/$sample/report.txt | grep -v "All statistics" | sed 's/Total length (>= 0 bp)//g' | sed 's/ //g') ; fi

echo "The genome length for $sample is $genome_length"

run_assembly_readMetrics.pl $input --fast --numcpus $threads -e $genome_length > $outfile
