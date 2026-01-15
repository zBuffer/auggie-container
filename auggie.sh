#!/bin/bash

if [ "$1" = "build" -o "$(docker images -q auggie 2> /dev/null)" = "" ]; then
    echo "Docker image 'auggie' does not exist. Building..."
    # check if AUGGIE_HOME is set
    if [ -z "$AUGGIE_HOME" ]; then
        docker build --build-arg UID=$(id -u) -t auggie .
    else
        docker build --build-arg UID=$(id -u) -t auggie "$AUGGIE_HOME"
    fi
    exit 0
fi

if [ "$1" = "alias" ]; then
    # Detect shell config file (macOS uses zsh by default)
    if [ -n "$ZSH_VERSION" ] || [ "$SHELL" = "/bin/zsh" ]; then
        RC_FILE="$HOME/.zshrc"
    else
        RC_FILE="$HOME/.bashrc"
    fi
    echo "export AUGGIE_HOME=$(pwd)" >> "$RC_FILE"
    echo "alias aug='$(pwd)/auggie.sh'" >> "$RC_FILE"
    echo "alias added to $RC_FILE"
    echo "Run 'source $RC_FILE' or restart your terminal to use it."
    exit 0
fi

docker run -u $(id -u):$(id -g) --net=host --rm -it -v $(pwd):/app -v ~/.augment:/home/auggie/.augment auggie

