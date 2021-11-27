FROM huang6385/azure_ml

WORKDIR /root
RUN apt install -y zsh && \
    chsh -s /bin/zsh && \
    git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh && \
    git clone --depth=1 https://github.com/Chen-Dixi/dotfiles.git && cd dotfiles/zsh && \
    bash ./zsh.sh && conda init zsh

WORKDIR /root