FROM ubuntu:20.04
LABEL maintainer="Taekyung Heo <tkheo@casys.kaist.ac.kr>"

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get -y update \
    && apt-get -y install\
    tcsh vim gcc g++ make cmake\
    libboost-dev libboost-program-options-dev\
    python3 git

RUN git clone --recurse-submodules https://github.com/astra-sim/tutorials.git && \
    cd tutorials/asplos2022/ && \
    ./clone_astra_sim.sh
