if [ "$#" -ne 1 ]; then
    echo "$0 <container name>"
    exit 1
fi

docker run --rm -it --gpus all -p 8888:8888 -p 6006:6006 --name $1 --mount type=bind,source=$(pwd),target=/root/ chendixi/msra_ml:1.2 zsh