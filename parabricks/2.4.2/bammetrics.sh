#!/bin/bash

set -xv

set -o errexit
set -o nounset
set -o pipefail

sample_name=${1}
input_cram=${2}
reference_fasta=${3}
output_dir=${4}
num_threads=${5}

/opt/pkg/parabricks/v2.4.2/pbrun bammetrics \
    --ref ${reference_fasta} \
    --bam ${input_cram} \
    --out-metrics-file ${output_dir}/${sample_name}.pbrun-bammetrics.txt \
    --num-threads ${num_threads}
