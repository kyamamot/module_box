#!/bin/bash

set -xv

for i in NA12878 NA12891 NA12892
do
    /tools/fastqc_v0.11.9/fastqc \
    -d /scratch/tmp \
    -t $(nproc) \
    -o /scratch/NCGM \
    /s3/NCGM/${i}/fastq/${i}_R1.fastq.gz \
    /s3/NCGM/${i}/fastq/${i}_R2.fastq.gz
done
