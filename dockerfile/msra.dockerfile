FROM huang6385/azure_ml

WORKDIR /root
RUN apt intall -y zsh && \
    chsh -s /bin/zsh


