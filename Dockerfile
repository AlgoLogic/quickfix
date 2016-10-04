# QuickFIX

FROM debian
MAINTAINER Akira Baruah <akira@algo-logic.com>

RUN apt-get update && apt-get install -y \
    automake \
    g++ \
    libtool \
    libxml2 \
    libxml2-dev \
    make

COPY . /quickfix
WORKDIR /quickfix
RUN ./bootstrap && ./configure
RUN make
RUN make install
WORKDIR /quickfix/bin
ENV PATH="/quickfix/bin:$PATH"
