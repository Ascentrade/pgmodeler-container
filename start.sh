#!/usr/bin/env bash

volume="${1:-${HOME}}"

xhost +local:*

if [[ -x $(command -v podman) ]]
then
    shopt -s expand_aliases
    alias docker=podman
fi

if [[ "${volume}" =~ ^(\/{0,1})[A-Za-z0-9\/\-_]+$ ]]
then
    if [[ $(echo $XDG_SESSION_TYPE) == "x11" ]]
    then
        docker run --rm --interactive --tty --security-opt label=disable --volume /tmp/.X11-unix/:/tmp/.X11-unix/ --volume "${volume}":/mnt/ --env DISPLAY pgmodeler

    elif [[ $(echo $XDG_SESSION_TYPE) == "wayland" ]]
    then
        docker run --rm --interactive --tty --security-opt label=type:container_runtime_t --network host --volume "${volume}":/mnt/ --env DISPLAY pgmodeler 
    fi
else
    echo "Wrong volume format supplied."
fi