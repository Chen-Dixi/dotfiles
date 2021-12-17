FROM chendixi/msra_ml:1.3

SHELL ["/bin/zsh", "-c"]

RUN source /root/.zshrc && \
    conda create --name d2l python=3.8 -y && \
    conda activate d2l && \
    pip install torch==1.8.1 && \
    pip install torchvision==0.9.1 && \
    pip install d2l==0.17.1
    
WORKDIR /root