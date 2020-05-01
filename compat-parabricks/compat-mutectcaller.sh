#!/bin/bash

set -xv

set -o errexit
set -o nounset
set -o pipefail

output_dir=$(dirname ${OUTPUT_VCF})
if [ ! -d ${output_dir} ]; then
	mkdir -p ${output_dir}
fi

/usr/bin/java \
    -XX:-UseContainerSupport \
    -jar /tools/gatk-4.0.4.0/gatk-package-4.0.4.0-local.jar Mutect2 \
    -I=${IN_TUMOR_CRAM} \
    -I=${IN_NORMAL_CRAM} \
    --tumor-sample ${IN_TUMOR_NAME} \
    --normal-sample ${IN_NORMAL_NAME} \
    -O=${OUTPUT_VCF} \
    -R=${REFERENCE_DIR}/${REFERENCE_FASTA} \
    --TMP_DIR=${output_dir}
