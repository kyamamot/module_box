FROM ubuntu:18.04
MAINTAINER Keisuke Yamamoto <ke1suke.yamam0t0.123@gmail.com>

WORKDIR /tools

RUN apt-get update && \
    apt-get install -y \
    automake \
    cmake \
    gcc \
    g++ \
    make \
    python \
    wget \
    zlib1g-dev

# kallisto-0.46.2
RUN wget https://github.com/pachterlab/kallisto/archive/v0.46.2.tar.gz && \
    tar xzf v0.46.2.tar.gz && \
    rm -f v0.46.2.tar.gz && \
    mkdir kallisto-0.46.2/build && \
    cd kallisto-0.46.2/build && \
    cmake -DCMAKE_INSTALL_PREFIX:PATH=/tools/kallisto-0.46.2 .. && \
    make && \
    make install

# pizzly-0.37.3
RUN wget https://github.com/pmelsted/pizzly/archive/v0.37.3.tar.gz && \
    tar xzf v0.37.3.tar.gz && \
    rm -f v0.37.3.tar.gz && \
    mkdir pizzly-0.37.3/build && \
    cd pizzly-0.37.3/build && \
    cmake -DCMAKE_INSTALL_PREFIX:PATH=/tools/pizzly-0.37.3 .. && \
    make && \
    mkdir ../bin && \
    mv pizzly ../bin/

CMD ["/bin/bash"]
