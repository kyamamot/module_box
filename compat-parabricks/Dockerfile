FROM ubuntu:18.04
MAINTAINER Keisuke Yamamoto <ke1suke.yamam0t0.123@gmail.com>

WORKDIR /tools

RUN apt-get update && \
    apt-get install -y \
    bzip2 \
    gcc \
    g++ \
    libbz2-dev \
    liblzma-dev \
    libncurses5-dev \
    make \
    openjdk-8-jre \
    unzip \
    wget \
    zlib1g-dev

# bwa-0.7.15
RUN wget http://sourceforge.net/projects/bio-bwa/files/bwa-0.7.15.tar.bz2 && \
    tar xjf bwa-0.7.15.tar.bz2 && \
    rm -f bwa-0.7.15.tar.bz2 && \
    cd bwa-0.7.15 && \
    make

# samtools-1.9
RUN wget https://sourceforge.net/projects/samtools/files/samtools/1.9/samtools-1.9.tar.bz2 && \
    tar xjf samtools-1.9.tar.bz2 && \
    rm -f samtools-1.9.tar.bz2 && \
    cd samtools-1.9 && \
    make && \
    make install

# gatk-4.0.4.0
RUN wget https://github.com/broadinstitute/gatk/releases/download/4.0.4.0/gatk-4.0.4.0.zip && \
    unzip gatk-4.0.4.0.zip && \
    rm -f gatk-4.0.4.0.zip

CMD ["/bin/bash"]
