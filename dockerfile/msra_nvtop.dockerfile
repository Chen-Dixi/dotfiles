FROM chendixi/msra_ml:1.0

RUN apt-get update && apt install -y cmake libncurses5-dev libncursesw5-dev && \
    git clone https://github.com/Syllo/nvtop.git && \
    mkdir -p nvtop/build && cd nvtop/build  && \
    cmake .. && make && \
    make install