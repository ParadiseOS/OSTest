FROM debian:bullseye-slim

RUN apt update && apt install -y \
    wget                         \
    build-essential bison flex libgmp3-dev libmpc-dev libmpfr-dev texinfo

WORKDIR /usr/src

RUN wget "https://ftp.gnu.org/gnu/gcc/gcc-13.2.0/gcc-13.2.0.tar.gz"
RUN wget "https://ftp.gnu.org/gnu/binutils/binutils-2.41.tar.gz"
RUN tar -xzf "gcc-13.2.0.tar.gz"
RUN tar -xzf "binutils-2.41.tar.gz"
RUN rm "gcc-13.2.0.tar.gz"
RUN rm "binutils-2.41.tar.gz"

COPY build.sh .
RUN chmod +x build.sh
RUN ./build.sh

RUN mkdir os-src
COPY os-src os-src
WORKDIR /usr/src/os-src

COPY build-src.sh .
RUN chmod +x build-src.sh
CMD ./build-src.sh
