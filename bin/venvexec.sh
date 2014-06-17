#!/bin/bash
# Script to execute $@ in the activated environment the $@ is found in.

file="$1"
shift

path="$(cd "$(dirname "${file}")" && pwd -P)"

while [ "${path}" != '/' ]; do
    if [ "$(basename "$(dirname "${path}")")" = '.virtualenvs' ]; then
        source "${path}/bin/activate"
        break
    fi
    path="$(dirname "${path}")"
done

exec "$@"
