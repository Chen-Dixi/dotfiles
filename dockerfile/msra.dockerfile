FROM huang6385/azure_ml

WORKDIR /root

RUN apt-get update && apt install -y cmake libncurses5-dev libncursesw5-dev htop && \
    git clone https://github.com/Syllo/nvtop.git && \
    mkdir -p nvtop/build && cd nvtop/build  && \
    cmake .. && make && \
    make install

WORKDIR /root

COPY ./jupyter .jupyter
RUN apt install -y zsh && \
    chsh -s /bin/zsh && \
    git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh && \
    git clone --depth=1 https://github.com/Chen-Dixi/dotfiles.git && cd dotfiles/zsh && \
    bash ./zsh.sh && conda init zsh && conda install -y jupyter notebook

WORKDIR /root