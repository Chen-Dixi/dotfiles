# hub.docker.io:  chendixi/torch190_zsh
FROM pytorch/pytorch:1.9.0-cuda10.2-cudnn7-runtime
WORKDIR /root
ADD ./runner/requirements.txt /root


RUN apt-get update && DEBIAN_FRONTEND="noninteractive" apt-get install -y \
    build-essential libssl-dev \
    wget \
    git \
    tar

# 设置 ZSH
RUN cat /etc/apt/sources.list > /etc/apt/sources.list.bak && sed -i 's/deb.debian.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list && \
    sed -i 's|security.debian.org/debian-security|mirrors.tuna.tsinghua.edu.cn/debian-security|g' /etc/apt/sources.list && \
    apt install -y zsh && \
    chsh -s /bin/zsh && \
    git clone --depth=1 https://gitee.com/mirrors/oh-my-zsh.git ~/.oh-my-zsh && \
    git clone --depth=1 https://gitee.com/chen-dixi/dotfiles.git && cd dotfiles/zsh && \
    bash ./zsh.sh

RUN pip install --upgrade pip \
    && pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple

CMD ["zsh"]

ENV LANG C.UTF-8
EXPOSE 8000