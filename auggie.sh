#!/bin/bash

if [ "$1" = "build" -o "$(docker images -q auggie 2> /dev/null)" = "" ]; then
    echo "Docker image 'auggie' does not exist. Building..."
    docker build --build-arg UID=$(id -u) -t auggie .
    exit 0
fi

if [ "$1" = "alias" ]; then
    echo "alias aug='$(pwd)/auggie.sh'" >> ~/.bashrc
    echo "alias added to ~/.bashrc"
    source ~/.bashrc
    exit 0
fi

docker run -u $(id -u):$(id -g) --net=host --rm -it -v $(pwd):/app -v ~/.augment:/home/node/.augment auggie