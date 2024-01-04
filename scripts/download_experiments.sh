#!/usr/bin/env bash


# Define a list of valid experiment IDs
valid_experiments=("GSE120561" "GSE93028" "PRJNA996350")

# Check if the correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 -experiment <EXPERIMENT_ID>"
    exit 1
fi

# Check if the first argument is "-experiment"
if [ "$1" != "-experiment" ]; then
    echo "Invalid option: $1"
    echo "Usage: $0 -experiment <EXPERIMENT_ID>"
    exit 1
fi

experiment=$2
is_valid_experiment=false

# Check if the provided experiment ID is in the valid experiments list
for valid_experiment in "${valid_experiments[@]}"; do
    if [ "$experiment" = "$valid_experiment" ]; then
        is_valid_experiment=true
        break
    fi
done

# If the experiment ID is not valid, exit the script
if [ "$is_valid_experiment" = false ]; then
    echo "Invalid experiment ID: $experiment"
    echo "Valid experiment IDs: ${valid_experiments[*]}"
    exit 1
fi


if [ "$experiment" = "GSE120561" ]; then
# Sample - GSE120561 (queen, queenless-worker and worker)
#
#https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE120561
    mkdir -p experiments/GSE120561
    echo "Downloading GSE120561"
    curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR790/006/SRR7908186/SRR7908186.fastq.gz -o experiments/GSE120561/SRR7908186_W1_Worker_Pool_1.fastq.gz
    curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR790/007/SRR7908187/SRR7908187.fastq.gz -o experiments/GSE120561/SRR7908187_W2_Worker_Pool_2.fastq.gz
    curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR790/008/SRR7908188/SRR7908188.fastq.gz -o experiments/GSE120561/SRR7908188_AW1_Active_Pool_1.fastq.gz
    curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR790/009/SRR7908189/SRR7908189.fastq.gz -o experiments/GSE120561/SRR7908189_AW2_Active_Pool_2.fastq.gz
    curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR790/001/SRR7908191/SRR7908191.fastq.gz -o experiments/GSE120561/SRR7908191_Q2_Queen_Pool_2.fastq.gz
    curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR790/000/SRR7908190/SRR7908190.fastq.gz -o experiments/GSE120561/SRR7908190_Q1_Queen_Pool_1.fastq.gz



elif [ "$experiment" = "GSE93028" ]; then
# sample experiment id GSE93028 
# Title:	Integration of lncRNA-miRNA-mRNA reveals novel insights into reproductive regulation in honey bees
# Organism:	Apis mellifera
# Experiment type:	Expression profiling by high throughput sequencing Non-coding RNA profiling by high throughput sequencing
# link: https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE93028

    mkdir -p experiments/GSE93028
    echo "Downloading GSE93028"

    # (1) ovaries of virgin queens (n=3); Characteristics: tissue: ovaries, age: virgin queen. 
    curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR513/008/SRR5136448/SRR5136448_1.fastq.gz -o experiments/GSE93028/SRR5136448_V01_1.fastq.gz
    curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR513/008/SRR5136448/SRR5136448_2.fastq.gz -o experiments/GSE93028/SRR5136448_V01_2.fastq.gz
    curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR513/009/SRR5136449/SRR5136449_1.fastq.gz -o experiments/GSE93028/SRR5136449_V02_1.fastq.gz
    curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR513/009/SRR5136449/SRR5136449_2.fastq.gz -o experiments/GSE93028/SRR5136449_V02_2.fastq.gz
    curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR513/000/SRR5136450/SRR5136450_1.fastq.gz -o experiments/GSE93028/SRR5136450_V03_1.fastq.gz
    curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR513/000/SRR5136450/SRR5136450_2.fastq.gz -o experiments/GSE93028/SRR5136450_V03_2.fastq.gz

    # (2) ovaries of egg-laying queens (n=3); Characteristics tissue: ovaries, age: normal egg-laying queen
    curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR513/001/SRR5136451/SRR5136451_1.fastq.gz -o experiments/GSE93028/SRR5136451_Q01_1.fastq.gz
    curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR513/001/SRR5136451/SRR5136451_2.fastq.gz -o experiments/GSE93028/SRR5136451_Q01_2.fastq.gz
    curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR513/002/SRR5136452/SRR5136452_1.fastq.gz -o experiments/GSE93028/SRR5136452_Q02_1.fastq.gz
    curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR513/002/SRR5136452/SRR5136452_2.fastq.gz -o experiments/GSE93028/SRR5136452_Q02_2.fastq.gz
    curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR513/003/SRR5136453/SRR5136453_1.fastq.gz -o experiments/GSE93028/SRR5136453_Q03_1.fastq.gz
    curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR513/003/SRR5136453/SRR5136453_2.fastq.gz -o experiments/GSE93028/SRR5136453_Q03_2.fastq.gz

    # (3) ovaries of egg-laying inhibited queens (n=3); Characteristics tissue: ovaries, age: egg-laying inhibited queen treatment: Caged for 7 days
    curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR513/004/SRR5136454/SRR5136454_1.fastq.gz -o experiments/GSE93028/SRR5136454_C01_1.fastq.gz
    curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR513/004/SRR5136454/SRR5136454_2.fastq.gz -o experiments/GSE93028/SRR5136454_C01_2.fastq.gz
    curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR513/005/SRR5136455/SRR5136455_1.fastq.gz -o experiments/GSE93028/SRR5136455_C02_1.fastq.gz
    curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR513/005/SRR5136455/SRR5136455_2.fastq.gz -o experiments/GSE93028/SRR5136455_C02_2.fastq.gz
    curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR513/006/SRR5136456/SRR5136456_1.fastq.gz -o experiments/GSE93028/SRR5136456_C03_1.fastq.gz
    curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR513/006/SRR5136456/SRR5136456_2.fastq.gz -o experiments/GSE93028/SRR5136456_C03_2.fastq.gz

    # (4) ovaries of egg-laying recovered queens (n=3); Characteristics tissue: ovaries, age: egg-laying recovered queen
    # treatment: the queen was released after caged for seven days. And on the eighth day, the queen recovered to normal condition and laid eggs. 
    curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR513/007/SRR5136457/SRR5136457_1.fastq.gz -o experiments/GSE93028/SRR5136457_R01_1.fastq.gz
    curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR513/007/SRR5136457/SRR5136457_2.fastq.gz -o experiments/GSE93028/SRR5136457_R01_2.fastq.gz
    curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR513/008/SRR5136458/SRR5136458_1.fastq.gz -o experiments/GSE93028/SRR5136458_R02_1.fastq.gz
    curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR513/008/SRR5136458/SRR5136458_2.fastq.gz -o experiments/GSE93028/SRR5136458_R02_2.fastq.gz
    curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR513/009/SRR5136459/SRR5136459_1.fastq.gz -o experiments/GSE93028/SRR5136459_R03_1.fastq.gz
    curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR513/009/SRR5136459/SRR5136459_2.fastq.gz -o experiments/GSE93028/SRR5136459_R03_2.fastq.gz


    # sample experiment id GSE119256 
    # Title:	Genome-wide analysis of coding and non-coding RNAs in ovary of honey bee workers
    # Organism:	Apis mellifera
    # Source name:	workers_ovary_mRNA including lncRNA
    # Organism:	Apis mellifera
    # Characteristics social caste: honey bee workers
    # tissue: ovaries
    # molecule subtype: mRNA including lncRNA
    # Extracted molecule	total RNA
    # limk: https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE119256

    curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR777/009/SRR7770429/SRR7770429_1.fastq.gz -o experiments/GSE93028/SRR7770429_W01_1.fastq.gz
    curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR777/009/SRR7770429/SRR7770429_2.fastq.gz -o experiments/GSE93028/SRR7770429_W01_2.fastq.gz
    curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR777/002/SRR7770432/SRR7770432_1.fastq.gz -o experiments/GSE93028/SRR7770432_W02_1.fastq.gz
    curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR777/002/SRR7770432/SRR7770432_2.fastq.gz -o experiments/GSE93028/SRR7770432_W02_2.fastq.gz
    curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR777/005/SRR7770435/SRR7770435_1.fastq.gz -o experiments/GSE93028/SRR7770435_W03_1.fastq.gz
    curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR777/005/SRR7770435/SRR7770435_2.fastq.gz -o experiments/GSE93028/SRR7770435_W03_2.fastq.gz



elif [ "$experiment" = "PRJNA996350" ]; then
    mkdir -p experiments/PRJNA996350
    # controls
    curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR253/009/SRR25343809/SRR25343809_1.fastq.gz -o experiments/PRJNA996350/SRR25343809_con3_1.fastq.gz
    curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR253/009/SRR25343809/SRR25343809_2.fastq.gz -o experiments/PRJNA996350/SRR25343809_con3_2.fastq.gz
    curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR253/010/SRR25343810/SRR25343810_1.fastq.gz -o experiments/PRJNA996350/SRR25343810_con2_1.fastq.gz
    curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR253/010/SRR25343810/SRR25343810_2.fastq.gz -o experiments/PRJNA996350/SRR25343810_con2_2.fastq.gz
    curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR253/011/SRR25343811/SRR25343811_1.fastq.gz -o experiments/PRJNA996350/SRR25343811_con1_1.fastq.gz
    curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR253/011/SRR25343811/SRR25343811_2.fastq.gz -o experiments/PRJNA996350/SRR25343811_con1_2.fastq.gz
    # RNA-i
    curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR253/012/SRR25343812/SRR25343812_1.fastq.gz -o experiments/PRJNA996350/SRR25343812_RNAi3_1.fastq.gz
    curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR253/012/SRR25343812/SRR25343812_2.fastq.gz -o experiments/PRJNA996350/SRR25343812_RNAi3_2.fastq.gz
    curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR253/013/SRR25343813/SRR25343813_1.fastq.gz -o experiments/PRJNA996350/SRR25343813_RNAi2_1.fastq.gz
    curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR253/013/SRR25343813/SRR25343813_2.fastq.gz -o experiments/PRJNA996350/SRR25343813_RNAi2_2.fastq.gz
    curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR253/014/SRR25343814/SRR25343814_1.fastq.gz -o experiments/PRJNA996350/SRR25343814_RNAi1_1.fastq.gz
    curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR253/014/SRR25343814/SRR25343814_2.fastq.gz -o experiments/PRJNA996350/SRR25343814_RNAi1_2.fastq.gz


fi