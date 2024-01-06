#!/bin/bash
set -o errexit

# how to run this script 
# bash scripts/run_QC.sh -experiment PRJNA996350

# Define a list of valid experiment IDs
valid_experiments=("GSE120561" "GSE93028" "PRJNA996350")
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



# Run the QC pipeline for the specified experiment
if [ "$experiment" = "GSE120561" ]; then
# Sample - GSE120561 (queen, queenless-worker and worker)
    mkdir -p experiments/GSE93028/QC
    echo "QC check GSE120561"
    fastqc -t 32 experiments/${experiment}/rawFastq/*.fastq.gz -o experiments/${experiment}/QC/
    #multiqc experiments/${experiment}/QC/ -o experiments/${experiment}/QC/


elif [ "$experiment" = "GSE93028" ]; then
# sample experiment id GSE93028 (lncRNA-miRNA-mRNA and reproductive regulation in honey bees)
    mkdir -p experiments/GSE93028/QC
    echo "QC check GSE93028"
    fastqc -t 32 experiments/${experiment}/rawFastq/*.fastq.gz -o experiments/${experiment}/QC/
    #multiqc experiments/${experiment}/QC/ -o experiments/${experiment}/QC/


elif [ "$experiment" = "PRJNA996350" ]; then
# sample experiment id PRJNA996350 (the transcriptome changes in honey bee larvae after inhibiting AmKr-h1 expression.)
    mkdir -p experiments/PRJNA996350/QC
    echo "QC check PRJNA996350"
    fastqc -t 32 experiments/${experiment}/rawFastq/*.fastq.gz -o experiments/${experiment}/QC/
    #multiqc experiments/${experiment}/QC/ -o experiments/${experiment}/QC/

   
fi