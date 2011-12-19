#!/bin/bash

__venv_prompt() {
    case $TERM in
        "xterm-color")
            echo "(\[\033[${VENV_PROMPT_COLOR}m\]$(basename "$VIRTUAL_ENV")\[\033[00m\])";;
        "xterm-256color")
            echo "(\[\033[${VENV_PROMPT_COLOR}m\]$(basename "$VIRTUAL_ENV")\[\033[00m\])";;
        *)
            echo "($(basename "$VIRTUAL_ENV"))";;
    esac
}

venv() {

    if [ ! -n "${VENV_DIR}" ] 
    then
        VENV_DIR="~/.venv"
    fi
    echo $VENV_DIR
    mkdir -p "$VENV_DIR"

    case "$1" in
        "create")
            virtualenv --prompt='$(__venv_prompt)'  "$VENV_DIR/$2";;
        "destroy")
            rm -rf "$VENV_DIR/$2";;
        "use")
            source "$VENV_DIR/$2/bin/activate";;
        "ls")
            ls "$VENV_DIR";;
        *)
            echo "venv [create <name>]
     [destroy <name>]
     [use <name>]
     [ls]";;
    esac
}

