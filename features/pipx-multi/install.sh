#! /usr/bin/bash



IFS=';' read -ra venvs <<< "$@"

for venv in "${venvs[@]}"
do
        IFS=',' read -ra packages <<< "$venv"
        PACKAGE="${packages[0]%%:*}" VERSION="latest" INJECTIONS="${packages[1]}" ./pipx-package.sh
done
