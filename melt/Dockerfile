FROM ubuntu:18.04
MAINTAINER Keisuke Yamamoto <ke1suke.yamam0t0.123@gmail.com>

WORKDIR /tools

RUN apt-get update && \
    apt-get install -y \
    bzip2 \
    cmake \
    gcc \
    g++ \
    libperl-dev \
    make \
    openjdk-8-jre \
    unzip \
    libbz2-dev \
    liblzma-dev \
    libncurses5-dev \
    wget \
    zlib1g-dev

# MELT-2.2.0
ADD MELTv2.2.0.tar.gz /

# bowtie2-2.4.1
RUN wget https://github.com/BenLangmead/bowtie2/releases/download/v2.4.1/bowtie2-2.4.1-linux-x86_64.zip && \
    unzip bowtie2-2.4.1-linux-x86_64.zip && \
    rm -f bowtie2-2.4.1-linux-x86_64.zip

# samtools-1.9
RUN wget https://sourceforge.net/projects/samtools/files/samtools/1.9/samtools-1.9.tar.bz2 && \
    tar xjf samtools-1.9.tar.bz2 && \
    rm -f samtools-1.9.tar.bz2 && \
    cd samtools-1.9 && \
    make && \
    make install

CMD ["/bin/bash"]
