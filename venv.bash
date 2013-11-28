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
        VENV_DIR="${HOME}/.venv"
    fi
    if [ ! -d $VENV_DIR ]
    then
        mkdir -p "${VENV_DIR}"
    fi
    
    case "$1" in
        "create")
            /usr/local/share/python/virtualenv --prompt='$(__venv_prompt)'  "$VENV_DIR/$2";;
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

__venv_completion() {
    local cur prev opts
    local venvs="$(venv ls)"
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts="create destroy use ls"

    case "${prev}" in
        destroy)
            COMPREPLY=( $(compgen -W $(venv ls) -- ${cur}) );;
        use)
            COMPREPLY=( $(compgen -W "${venvs}" -- ${cur}) );;
        *)
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) );;
    esac
}


complete -F __venv_completion venv

# use venv based virtual env by default if it exists
if [ -d ~/.venv/default ] ; then
    export VIRTUAL_ENV_DISABLE_PROMPT=true
    venv use default
    unset VIRTUAL_ENV_DISABLE_PROMPT
fi
