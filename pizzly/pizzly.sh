#!/bin/bash

set -xv

set -o errexit
set -o nounset
set -o pipefail

if [ ! -d ${OUTPUT_DIR} ]; then
	mkdir -p ${OUTPUT_DIR}
fi

/tools/kallisto-0.46.2/bin/kallisto quant \
    -i ${REFERENCE_KALLISTO_INDEX} \
    --fusion \
    -o ${OUTPUT_DIR} \
    ${INPUT_FASTQ_1} \
    ${INPUT_FASTQ_2}

/tools/pizzly-0.37.3/bin/pizzly \
    --gtf ${ANNOTATION_GTF} \
    --fasta ${REFERENCE_FASTA} \
    --output ${OUTPUT_DIR}/${SAMPLE_NAME}.pizzly \
    ${PIZZLY_OPTION} \
    ${OUTPUT_DIR}/fusion.txt

python /tools/pizzly-0.37.3/scripts/flatten_json.py \
    ${OUTPUT_DIR}/${SAMPLE_NAME}.pizzly.unfiltered.json \
    > ${OUTPUT_DIR}/${SAMPLE_NAME}.pizzly.unfiltered.table

python /tools/pizzly-0.37.3/scripts/flatten_json.py \
    ${OUTPUT_DIR}/${SAMPLE_NAME}.pizzly.json \
    > ${OUTPUT_DIR}/${SAMPLE_NAME}.pizzly.table
