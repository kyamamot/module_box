#!/bin/bash

set -xv

set -o errexit
set -o nounset
set -o pipefail

tumor_sample_name=${1}
input_tumor_bam=${2}
normal_sample_name=${3}
input_normal_bam=${4}
reference_fasta=${5}
output_dir=${6}
tmp_dir=${7}
num_gpus=${8}

/opt/pkg/parabricks/v2.5.0/pbrun mutectcaller \
    --ref ${reference_fasta} \
    --in-tumor-bam ${input_tumor_bam} \
    --tumor-name ${tumor_sample_name} \
    --in-normal-bam ${input_normal_bam} \
    --normal-name ${normal_sample_name} \
    --out-vcf ${output_dir}/${tumor_sample_name}.pbrun-mutectcaller.vcf \
    --tmp-dir ${tmp_dir} \
    --num-gpus ${num_gpus}
