#!/usr/bin/env bash

if [[ -x $(command -v podman) ]]
then
    shopt -s expand_aliases
    alias docker=podman
fi

docker build --pull "${@}" --tag 'pgmodeler' .