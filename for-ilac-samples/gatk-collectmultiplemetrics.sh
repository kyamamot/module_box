#!/bin/bash

set -xv

for i in NA12878 NA12891 NA12892
do
    /usr/bin/java8 \
    -jar /tools/gatk-4.0.4.0/gatk-package-4.0.4.0-local.jar \
    CollectMultipleMetrics \
    -I /s3/NCGM/${i}/BWA-GATK/${i}.markdup.bam \
    -O /s3/NCGM/${i}/BWA-GATK/${i}.markdup.CollectMultipleMetrics \
    -R /scratch/reference/GRCh38.d1.vd1/GRCh38.d1.vd1.fa
done
