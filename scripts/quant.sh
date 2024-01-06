#!/usr/bin/env bash

# Para terminar a execução do script se algum erro ocorrer
set -o errexit

# Define a list of valid experiment IDs
valid_experiments=("GSE120561" "GSE93028" "PRJNA996350")
experimentID=$2
is_valid_experiment=false

# Check if the provided experiment ID is in the valid experiments list
for valid_experiment in "${valid_experiments[@]}"; do
    if [ "$experimentID" = "$valid_experiment" ]; then
        is_valid_experiment=true
        break
    fi
done

# If the experiment ID is not valid, exit the script
if [ "$is_valid_experiment" = false ]; then
    echo "Invalid experiment ID: $experimentID"
    echo "Valid experiment IDs: ${valid_experiments[*]}"
    exit 1
fi



# Define the paths
KALLISTO_INDEX=data/kallisto_index/index_trans
SEQ_DIR=experiments/${experimentID}/rawFastq
OUT_DIR=experiments/${experimentID}/kallisto/quant

mkdir -p ${OUT_DIR}



# Define the file path
FILE="data/kallisto_index/index_trans"

# Check if the index does not exist
if [ ! -f "$FILE" ]; then
    echo "Index file does not exist. Running kallisto index..."
    kallisto index -i ${KALLISTO_INDEX} data/all_transcrits.fasta
else
    echo "File exists."
fi



if [ "$experimentID" = "GSE120561" ]; then
# Sample - GSE120561 (queen, queenless-worker and worker)

	for SAMPLE in W1 W2 AW1 AW2 Q1 Q2;
	do
		time kallisto quant -t 24 --single --fragment-length=49 --sd=1 -b 1000 -i ${KALLISTO_INDEX} -o ${OUT_DIR}/"$SAMPLE" ${SEQ_DIR}/*_"$SAMPLE"*.fastq.gz
	done
	
elif [ "$experimentID" = "GSE93028" ]; then
# sample experiment id GSE93028 (lncRNA-miRNA-mRNA and reproductive regulation in honey bees)

	for SAMPLE in V01 V02 V03 Q01 Q02 Q03 C01 C02 C03 R01 R02 R03 W01 W02 W03;
	do
		time kallisto quant -t 24 -b 1000 --rf-stranded -i ${KALLISTO_INDEX} -o ${OUT_DIR}/"$SAMPLE" ${SEQ_DIR}/*_"$SAMPLE"_1.fastq.gz ${SEQ_DIR}/*_"$SAMPLE"_2.fastq.gz
	done
	
elif [ "$experimentID" = "PRJNA996350" ]; then
# sample experiment id PRJNA996350 (the transcriptome changes in honey bee larvae after inhibiting AmKr-h1 expression.)
	
	for SAMPLE in con1 con2 con3 RNAi1 RNAi2 RNAi3;
	do
		time kallisto quant -t 24 -b 1000 --rf-stranded -i ${KALLISTO_INDEX} -o ${OUT_DIR}/"$SAMPLE" ${SEQ_DIR}/*_"$SAMPLE"_1.fastq.gz ${SEQ_DIR}/*_"$SAMPLE"_2.fastq.gz
	done


fi