# Image build on this dockerfile: hub.docker.io:  chendixi/torch190_zsh:jupyter
FROM chendixi/torch190_zsh:latest

WORKDIR /root
COPY ./jupyter .jupyter
RUN pip install jupyter notebook -i https://pypi.tuna.tsinghua.edu.cn/simple

CMD ["zsh"]

ENV LANG C.UTF-8
EXPOSE 8888

