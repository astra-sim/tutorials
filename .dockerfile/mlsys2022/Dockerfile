FROM ubuntu:20.04
LABEL maintainer="Will Won <william.won@gatech.edu>"

# Install dependencies
ENV DEBIAN_FRONTEND=noninteractive
RUN apt -y update
RUN apt -y install tcsh vim gcc g++ make cmake libboost-dev libboost-program-options-dev python3 git

# Clone ASTRA-sim and set branch
WORKDIR /app
RUN git clone --recurse-submodules https://github.com/astra-sim/tutorials.git
WORKDIR /app/tutorials/mlsys2022
RUN ./clone_astra_sim.sh
