FROM pytorch/pytorch:1.9.0-cuda10.2-cudnn7-devel

WORKDIR /root
RUN apt-get update && DEBIAN_FRONTEND="noninteractive" apt-get install -y \
    build-essential libssl-dev \
    wget \
    git \
    htop \
    screen \
    tar

# install cmake
WORKDIR /root
RUN wget https://github.com/Kitware/CMake/releases/download/v3.20.2/cmake-3.20.2.tar.gz
RUN tar -zxvf cmake-3.20.2.tar.gz
WORKDIR /root/cmake-3.20.2
RUN ./bootstrap && make && make install

ENV LD_LIBRARY_PATH=/opt/conda/lib:/opt/lib
ENV LD_PRELOAD=/opt/conda/lib/libmkl_core.so:/opt/conda/lib/libmkl_sequential.so

WORKDIR /root
# install libcint
RUN git clone https://github.com/sunqm/libcint.git
WORKDIR /root/libcint
RUN git checkout v4.0.7 && mkdir build
WORKDIR /root/libcint/build
RUN cmake -DWITH_F12=1 -DWITH_RANGE_COULOMB=1 -DWITH_COULOMB_ERF=1 \
    -DCMAKE_INSTALL_PREFIX:PATH=/opt -DCMAKE_INSTALL_LIBDIR:PATH=lib ..
RUN make && make install

# install libxc
WORKDIR /root
RUN git clone https://gitlab.com/libxc/libxc.git
WORKDIR /root/libxc
RUN git checkout 4.3.4 && mkdir -p build
WORKDIR /root/libxc/build
RUN cmake -DCMAKE_BUILD_TYPE=RELEASE -DBUILD_SHARED_LIBS=1 \
    -DENABLE_FORTRAN=0 -DDISABLE_KXC=0 -DDISABLE_LXC=1 \
    -DCMAKE_INSTALL_PREFIX:PATH=/opt -DCMAKE_INSTALL_LIBDIR:PATH=lib ..
RUN make && make install

# install xcfun
WORKDIR /root
RUN git clone https://github.com/sunqm/xcfun.git
WORKDIR /root/xcfun
RUN git checkout cmake-3.5 && mkdir build
WORKDIR /root/xcfun/build
RUN cmake -DCMAKE_BUILD_TYPE=RELEASE -DBUILD_SHARED_LIBS=1 -DXC_MAX_ORDER=3 -DXCFUN_ENABLE_TESTS=0 \
    -DCMAKE_INSTALL_PREFIX:PATH=/opt -DCMAKE_INSTALL_LIBDIR:PATH=lib ..
RUN make && make install

# pull pyscf
WORKDIR /opt
RUN git clone https://github.com/wesley-stone/pyscf.git
WORKDIR /opt/pyscf
RUN git checkout custom && mkdir -p pyscf/lib/build
WORKDIR /opt/pyscf/pyscf/lib/build
RUN cmake -DBLA_VENDOR=Intel10_64lp_seq -DBUILD_LIBCINT=0 -DBUILD_LIBXC=0 -DBUILD_XCFUN=0 -DCMAKE_INSTALL_PREFIX:PATH=/opt .. && make

WORKDIR /root

ENV PYTHONPATH=/opt/pyscf/:$PYTHONPATH
RUN pip install h5py==2.10.0 numpy scipy pandas hydra-core 

RUN pip install pytorch_lightning
RUN pip install tqdm
