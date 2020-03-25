#!/bin/bash

set -xv
set -o errexit
set -o nounset

mkdir -p ${OUTPUT_DIR}

time python /manta/bin/configManta.py \
    --bam ${INPUT_BAM} \
    --referenceFasta ${REFERENCE_DIR}/${REFERENCE_FILE} \
    --runDir ${OUTPUT_DIR} \

time python ${OUTPUT_DIR}/runWorkflow.py \
    -m local \
    -j $(nproc)
