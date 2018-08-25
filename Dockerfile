FROM ubuntu:18.10

#### http://www.pllab.riec.tohoku.ac.jp/smlsharp/docs/3.4.0/ja/Ch5.S3.xhtml

#### for build #####

RUN apt-get update \
    && apt-get install -y wget make cmake clang gcc g++ python libtool zlib1g zlib1g-dev m4 \
    && apt-get clean

#### MassiveThreads ####

RUN cd /usr/local/src \
    && wget https://github.com/massivethreads/massivethreads/archive/v0.99.tar.gz \
    && tar zxf v0.99.tar.gz \
    && cd massivethreads-0.99 \
    && ./configure CFLAGS="-Wall -O3" \
    && make \
    && make install \
    && make clean

#### LLVM 3.7.1 ####

RUN cd /usr/local/src \
    && wget http://releases.llvm.org/3.7.1/llvm-3.7.1.src.tar.xz \
    && tar Jxf llvm-3.7.1.src.tar.xz \
    && cd llvm-3.7.1.src \
    && mkdir build \
    && cd build \
    && ../configure --enable-shared --enable-optimized --disable-bindings \
    && make \
    && make install \
    && make clean

#### GMP Library ####

RUN cd /usr/local/src \
    && wget https://gmplib.org/download/gmp/gmp-6.1.2.tar.bz2 \
    && tar jxf gmp-6.1.2.tar.bz2 \
    && cd gmp-6.1.2 \
    && ./configure \
    && make \
    && make install \
    && make clean

#### YAJL Library ####

RUN cd /usr/local/src \
    && wget https://github.com/lloyd/yajl/archive/2.1.0.tar.gz \
    && tar xzf 2.1.0.tar.gz \
    && cd yajl-2.1.0 \
    && ./configure \
    && make \
    && make install \
    && make clean

#### smlsharp 3.4.0 ####

RUN cd /usr/local/src \
    && wget http://www.pllab.riec.tohoku.ac.jp/smlsharp/download/smlsharp-3.4.0.tar.gz \
    && tar zxf smlsharp-3.4.0.tar.gz \
    && cd smlsharp-3.4.0 \
    && ./configure \
    && make \
    && make install \
    && make clean

WORKDIR /use/local/src
