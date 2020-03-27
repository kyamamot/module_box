#!/bin/bash

#set -o errexit
#set -o nounset
#set -o pipefail
set -xv

if [ ! -d ${OUTPUT_DIR} ]; then
	mkdir -p ${OUTPUT_DIR}
fi

read_group="@RG\tID:${SAMPLE_NAME}\tPL:na\tLB:na\tSM:${SAMPLE_NAME}\tPU:${SAMPLE_NAME}"
time /tools/bwa-0.7.15/bwa mem \
    -t $(nproc) \
    -K 10000000 \
    -T 0 \
    -R "${read_group}" \
    ${REFERENCE_DIR}/${REFERENCE_FASTA} \
    ${INPUT_FASTQ_1} \
    ${INPUT_FASTQ_2} \
| /tools/gatk-4.0.4.0/gatk SortSam \
    --java-options "-XX:-UseContainerSupport -Xmx48g" \
    --MAX_RECORDS_IN_RAM=5000000 \
    -I=/dev/stdin \
    -O=${OUTPUT_DIR}/${SAMPLE_NAME}.bam \
    --SORT_ORDER=coordinate \
    --TMP_DIR=${OUTPUT_DIR}

time /tools/gatk-4.0.4.0/gatk MarkDuplicates \
    --java-options "-XX:-UseContainerSupport -Xmx48g" \
    -I=${OUTPUT_DIR}/${SAMPLE_NAME}.bam \
    -O=${OUTPUT_DIR}/${SAMPLE_NAME}.markdup.bam \
    -M=${OUTPUT_DIR}/${SAMPLE_NAME}.markdup.metrics \
    --TMP_DIR=${OUTPUT_DIR}

time /tools/samtools-1.9/samtools index \
    -@ $(nproc) \
    ${OUTPUT_DIR}/${SAMPLE_NAME}.markdup.bam

time /tools/gatk-4.0.4.0/gatk HaplotypeCaller \
    --java-options "-XX:-UseContainerSupport" \
    --input ${OUTPUT_DIR}/${SAMPLE_NAME}.markdup.bam \
    --output ${OUTPUT_DIR}/${SAMPLE_NAME}.markdup.gatk-hc.vcf \
    --reference ${REFERENCE_DIR}/${REFERENCE_FASTA} \
    --native-pair-hmm-threads $(nproc)
