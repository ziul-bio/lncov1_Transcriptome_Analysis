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


KALLISTO_INDEX=data/kallisto_index/index_trans
SEQ_DIR=experiments/${experimentID}/rawFastq
OUT_DIR=experiments/${experimentID}/kallisto/quant

mkdir -p ${OUT_DIR}


if [ "$experimentID" = "GSE120561" ]; then
# Sample - GSE120561 (queen, queenless-worker and worker)

	for SAMPLE in W1 W2 AW1 AW2 Q1 Q2;
	do
		time kallisto quant -t 24 --single --fragment-length=49 --sd=1 -b 1000 -i ${KALLISTO_INDEX} -o ${OUT_DIR}/"$SAMPLE" ${SEQ_DIR}/*_"$SAMPLE"*.fastq.gz
	done
	#time kallisto quant -t 24 --single --fragment-length=49 --sd=1 -b 1000 -i ${KALLISTO_INDEX} -o ${OUT_DIR}/w1 ${SEQ_DIR}/SRR7908186_W1_Worker_Pool_1.fastq.gz
	#time kallisto quant -t 24 --single --fragment-length=49 --sd=1 -b 1000 -i ${KALLISTO_INDEX} -o ${OUT_DIR}/w2 ${SEQ_DIR}/SRR7908187_W2_Worker_Pool_2.fastq.gz
	#time kallisto quant -t 24 --single --fragment-length=49 --sd=1 -b 1000 -i ${KALLISTO_INDEX} -o ${OUT_DIR}/aw1 ${SEQ_DIR}/SRR7908188_AW1_Active_Pool_1.fastq.gz
	#time kallisto quant -t 24 --single --fragment-length=49 --sd=1 -b 1000 -i ${KALLISTO_INDEX} -o ${OUT_DIR}/aw2 ${SEQ_DIR}/SRR7908189_AW2_Active_Pool_2.fastq.gz
	#time kallisto quant -t 24 --single --fragment-length=49 --sd=1 -b 1000 -i ${KALLISTO_INDEX} -o ${OUT_DIR}/q1 ${SEQ_DIR}/SRR7908190_Q1_Queen_Pool_1.fastq.gz
	#time kallisto quant -t 24 --single --fragment-length=49 --sd=1 -b 1000 -i ${KALLISTO_INDEX} -o ${OUT_DIR}/q2 ${SEQ_DIR}/SRR7908191_Q2_Queen_Pool_2.fastq.gz

elif [ "$experimentID" = "GSE93028" ]; then
# sample experiment id GSE93028 (lncRNA-miRNA-mRNA and reproductive regulation in honey bees)

	for SAMPLE in V01 V02 V03 Q01 Q02 Q03 C01 C02 C03 R01 R02 R03 W01 W02 W03;
	do
		time kallisto quant -t 24 -b 1000 --rf-stranded -i ${KALLISTO_INDEX} -o ${OUT_DIR}/"$SAMPLE" ${SEQ_DIR}/*_"$SAMPLE"_1.fastq.gz ${SEQ_DIR}/*_"$SAMPLE"_2.fastq.gz
	done
	#time kallisto quant -t 24 -b 1000 --rf-stranded -i ${KALLISTO_INDEX} -o ${OUT_DIR}/V01 ${SEQ_DIR}/SRR5136448_V01_1.fastq.gz ${SEQ_DIR}/SRR5136448_V01_2.fastq.gz
	#time kallisto quant -t 24 -b 1000 --rf-stranded -i ${KALLISTO_INDEX} -o ${OUT_DIR}/V02 ${SEQ_DIR}/SRR5136449_V02_1.fastq.gz ${SEQ_DIR}/SRR5136449_V02_2.fastq.gz
	#time kallisto quant -t 24 -b 1000 --rf-stranded -i ${KALLISTO_INDEX} -o ${OUT_DIR}/V03 ${SEQ_DIR}/SRR5136450_V03_1.fastq.gz ${SEQ_DIR}/SRR5136450_V03_2.fastq.gz
	#time kallisto quant -t 24 -b 1000 --rf-stranded -i ${KALLISTO_INDEX} -o ${OUT_DIR}/Q01 ${SEQ_DIR}/SRR5136451_Q01_1.fastq.gz ${SEQ_DIR}/SRR5136451_Q01_2.fastq.gz
	#time kallisto quant -t 24 -b 1000 --rf-stranded -i ${KALLISTO_INDEX} -o ${OUT_DIR}/Q02 ${SEQ_DIR}/SRR5136452_Q02_1.fastq.gz ${SEQ_DIR}/SRR5136452_Q02_2.fastq.gz
	#time kallisto quant -t 24 -b 1000 --rf-stranded -i ${KALLISTO_INDEX} -o ${OUT_DIR}/Q03 ${SEQ_DIR}/SRR5136453_Q03_1.fastq.gz ${SEQ_DIR}/SRR5136453_Q03_2.fastq.gz
	#time kallisto quant -t 24 -b 1000 --rf-stranded -i ${KALLISTO_INDEX} -o ${OUT_DIR}/C01 ${SEQ_DIR}/SRR5136454_C01_1.fastq.gz ${SEQ_DIR}/SRR5136454_C01_2.fastq.gz
	#time kallisto quant -t 24 -b 1000 --rf-stranded -i ${KALLISTO_INDEX} -o ${OUT_DIR}/C02 ${SEQ_DIR}/SRR5136455_C02_1.fastq.gz ${SEQ_DIR}/SRR5136455_C02_2.fastq.gz
	#time kallisto quant -t 24 -b 1000 --rf-stranded -i ${KALLISTO_INDEX} -o ${OUT_DIR}/C03 ${SEQ_DIR}/SRR5136456_C03_1.fastq.gz ${SEQ_DIR}/SRR5136456_C03_2.fastq.gz
	#time kallisto quant -t 24 -b 1000 --rf-stranded -i ${KALLISTO_INDEX} -o ${OUT_DIR}/R01 ${SEQ_DIR}/SRR5136457_R01_1.fastq.gz ${SEQ_DIR}/SRR5136457_R01_2.fastq.gz
	#time kallisto quant -t 24 -b 1000 --rf-stranded -i ${KALLISTO_INDEX} -o ${OUT_DIR}/R02 ${SEQ_DIR}/SRR5136458_R02_1.fastq.gz ${SEQ_DIR}/SRR5136458_R02_2.fastq.gz
	#time kallisto quant -t 24 -b 1000 --rf-stranded -i ${KALLISTO_INDEX} -o ${OUT_DIR}/R03 ${SEQ_DIR}/SRR5136459_R03_1.fastq.gz ${SEQ_DIR}/SRR5136459_R03_2.fastq.gz
	#time kallisto quant -t 24 -b 1000 --rf-stranded -i ${KALLISTO_INDEX} -o ${OUT_DIR}/W01 ${SEQ_DIR}/SRR7770429_W01_1.fastq.gz ${SEQ_DIR}/SRR7770429_W01_Seq_2.fastq.gz
	#time kallisto quant -t 24 -b 1000 --rf-stranded -i ${KALLISTO_INDEX} -o ${OUT_DIR}/W02 ${SEQ_DIR}/SRR7770432_W02_1.fastq.gz ${SEQ_DIR}/SRR7770432_W02_Seq_2.fastq.gz
	#time kallisto quant -t 24 -b 1000 --rf-stranded -i ${KALLISTO_INDEX} -o ${OUT_DIR}/W03 ${SEQ_DIR}/SRR7770435_W03_1.fastq.gz ${SEQ_DIR}/SRR7770435_W03_Seq_2.fastq.gz


elif [ "$experimentID" = "PRJNA996350" ]; then
# sample experiment id PRJNA996350 (the transcriptome changes in honey bee larvae after inhibiting AmKr-h1 expression.)
	
	for SAMPLE in con1 con2 con3 RNAi1 RNAi2 RNAi3;
	do
		time kallisto quant -t 24 -b 1000 --rf-stranded -i ${KALLISTO_INDEX} -o ${OUT_DIR}/"$SAMPLE" ${SEQ_DIR}/*_"$SAMPLE"_1.fastq.gz ${SEQ_DIR}/*_"$SAMPLE"_2.fastq.gz
	done

	#time kallisto quant -t 24 -b 1000 -i ${KALLISTO_INDEX} -o ${OUT_DIR}/con1 ${SEQ_DIR}/SRR25343811_con1_1.fastq.gz ${SEQ_DIR}/SRR25343811_con1_2.fastq.gz 
	#time kallisto quant -t 24 -b 1000 -i ${KALLISTO_INDEX} -o ${OUT_DIR}/con2 ${SEQ_DIR}/SRR25343810_con2_1.fastq.gz ${SEQ_DIR}/SRR25343810_con2_2.fastq.gz
	#time kallisto quant -t 24 -b 1000 -i ${KALLISTO_INDEX} -o ${OUT_DIR}/con3 ${SEQ_DIR}/SRR25343809_con3_1.fastq.gz ${SEQ_DIR}/SRR25343809_con3_2.fastq.gz
	#time kallisto quant -t 24 -b 1000 -i ${KALLISTO_INDEX} -o ${OUT_DIR}/RNAi1 ${SEQ_DIR}/SRR25343814_RNAi1_1.fastq.gz ${SEQ_DIR}/SRR25343814_RNAi1_2.fastq.gz
	#time kallisto quant -t 24 -b 1000 -i ${KALLISTO_INDEX} -o ${OUT_DIR}/RNAi2 ${SEQ_DIR}/SRR25343813_RNAi2_1.fastq.gz ${SEQ_DIR}/SRR25343813_RNAi2_2.fastq.gz 
	#time kallisto quant -t 24 -b 1000 -i ${KALLISTO_INDEX} -o ${OUT_DIR}/RNAi3 ${SEQ_DIR}/SRR25343812_RNAi3_1.fastq.gz  ${SEQ_DIR}/SRR25343812_RNAi3_2.fastq.gz   

fi