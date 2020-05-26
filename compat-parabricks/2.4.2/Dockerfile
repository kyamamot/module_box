FROM ubuntu:16.04
MAINTAINER Keisuke Yamamoto <ke1suke.yamam0t0.123@gmail.com>

WORKDIR /tools

RUN apt-get update && \
    apt-get install -y \
    bzip2 \
    gcc \
    gfortran \
    g++ \
    libblas-dev \
    libbz2-dev \
    liblzma-dev \
    libncurses5-dev \
    make \
    openjdk-8-jre \
    software-properties-common \
    unzip \
    wget \
    zlib1g-dev

# R
RUN apt-key adv \
    --keyserver keyserver.ubuntu.com \
    --recv-keys 51716619E084DAB9 && \
    add-apt-repository "deb http://cran.rstudio.com/bin/linux/ubuntu xenial/" && \
    apt-get update && \
    apt-get install -y \
    r-base-core=3.2.5-1xenial \
    r-base-dev=3.2.5-1xenial

RUN apt-get -y clean && \
    apt-get -y autoremove && \
    apt-get -y autoclean

# R packages
## dependencies
RUN R -e "install.packages(c('digest', 'gtable', 'MASS', 'plyr', 'reshape2', 'scales', 'tibble', 'lazyeval', 'tidyselect', 'BH', 'plogr'), repos = 'https://cran.r-project.org/', clean = TRUE)"
RUN R -e "install.packages('https://cran.r-project.org/src/contrib/Archive/bitops/bitops_1.0-5.tar.gz', repos = NULL, type = 'source', clean = TRUE)"
RUN R -e "install.packages('https://cran.r-project.org/src/contrib/Archive/caTools/caTools_1.17.tar.gz', repos = NULL, type = 'source', clean = TRUE)"
RUN R -e "install.packages('https://cran.r-project.org/src/contrib/Archive/gtools/gtools_3.8.1.tar.gz', repos = NULL, type = 'source', clean = TRUE)"
RUN R -e "install.packages('https://cran.r-project.org/src/contrib/Archive/gdata/gdata_2.17.0.tar.gz', repos = NULL, type = 'source', clean = TRUE)"
RUN R -e "install.packages('https://cran.r-project.org/src/contrib/Archive/KernSmooth/KernSmooth_2.23-16.tar.gz', repos = NULL, type = 'source', clean = TRUE)"
RUN R -e "install.packages('https://cran.r-project.org/src/contrib/Archive/gplots/gplots_3.0.1.2.tar.gz', repos = NULL, type = 'source', clean = TRUE)"
## for gatk
RUN R -e "install.packages('http://cran.r-project.org/src/contrib/Archive/getopt/getopt_1.20.0.tar.gz', repos = NULL, type = 'source', clean = TRUE)"
RUN R -e "install.packages('http://cran.r-project.org/src/contrib/Archive/optparse/optparse_1.3.2.tar.gz', repos = NULL, type = 'source', clean = TRUE)"
RUN R -e "install.packages('http://cran.r-project.org/src/contrib/Archive/data.table/data.table_1.10.4-2.tar.gz', repos = NULL, type = 'source', clean = TRUE)"
RUN R -e "install.packages('http://cran.r-project.org/src/contrib/gsalib_2.1.tar.gz', repos = NULL, type = 'source', clean = TRUE)"
RUN R -e "install.packages('http://cran.r-project.org/src/contrib/Archive/ggplot2/ggplot2_2.2.1.tar.gz', repos = NULL, type = 'source', clean = TRUE)"
RUN R -e "install.packages('http://cran.r-project.org/src/contrib/Archive/dplyr/dplyr_0.8.0.1.tar.gz', repos = NULL, type = 'source', clean = TRUE)"

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
