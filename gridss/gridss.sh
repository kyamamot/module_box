#!/bin/bash

set -xv
set -o errexit
set -o nounset

mkdir -p ${OUTPUT_DIR}

cd /opt/gridss

time bash gridss.sh \
    -o ${OUTPUT_DIR}/${VCF}  \
    -a ${OUTPUT_DIR}/${ASSEMBLE} \
    -r ${REFERENCE_DIR}/${REFERENCE_FILE}  \
    -j ${GRIDSS_JAR} \
    -t $(nproc) \
    -w ${OUTPUT_DIR} \
    --picardoptions VALIDATION_STRINGENCY=LENIENT \
    ${INPUT_BAM}
