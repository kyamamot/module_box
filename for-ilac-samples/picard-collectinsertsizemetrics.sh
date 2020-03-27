#!/bin/bash

set -xv

for i in NA12878 NA12891 NA12892
do
    /usr/bin/java8 \
    -jar /tools/picard-2.21.8/picard.jar \
    CollectInsertSizeMetrics \
    I=/s3/NCGM/${i}/BWA-GATK/${i}.markdup.bam \
    O=/scratch/NCGM/${i}/${i}.markdup.bam.CollectInsertSizeMetrics.txt \
    H=/scratch/NCGM/${i}/${i}.markdup.bam.CollectInsertSizeMetrics.pdf
done
