FROM ubuntu:18.04
MAINTAINER Keisuke Yamamoto <ke1suke.yamam0t0.123@gmail.com>

WORKDIR /tools

RUN apt-get update && \
    apt-get install -y \
    openjdk-8-jre \
    libfindbin-libs-perl \
    unzip \
    wget

RUN wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.9.zip && \
    unzip fastqc_v0.11.9.zip && \
    rm -f fastqc_v0.11.9.zip && \
    mv FastQC fastqc_v0.11.9 && \
    cd fastqc_v0.11.9 && \
    chmod a+x fastqc

CMD ["/bin/bash"]
