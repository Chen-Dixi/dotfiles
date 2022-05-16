# Image build on this dockerfile: hub.docker.io:  chendixi/torch190_zsh:jupyter
FROM chendixi/torch190_zsh:ml

ADD ./torch1_9_ml_requirements.txt /root

WORKDIR /root

RUN pip install -r torch1_9_ml_requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple

CMD ["zsh"]

ENV LANG C.UTF-8
EXPOSE 8888

