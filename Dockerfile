ARG CUDA_VERSION=11.6.0
ARG UBUNTU_VERSION=20.04

FROM nvidia/cuda:$CUDA_VERSION-devel-ubuntu$UBUNTU_VERSION AS build
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y \
&& apt-get install -y cmake \
                      git \
                      perl \
                      curl
COPY . /tmp
RUN cd /tmp \
&& git submodule update --init --recursive \
&& mkdir -p ethminer/build \
&& cd ethminer/build \
&& cmake .. -DETHASHCUDA=ON -DETHASHCL=OFF -DETHSTRATUM=ON \
&& cmake --build . \
&& make install

FROM nvidia/cuda:$CUDA_VERSION-runtime-ubuntu$UBUNTU_VERSION
COPY --from=build /tmp/ethminer/build/ethminer /usr/bin/ethminer
ENTRYPOINT ["/usr/bin/ethminer/ethminer"]
