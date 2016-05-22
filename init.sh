#!/bin/bash

DOTFILES="i3 i3status.conf ssh/config vimrc zshrc"

echo "Se han de instalar las siguientes dependencias:"
echo "apt-get install i3 vim tmux zsh"

echo "Creando enlaces simbolicos"
for FILE in $DOTFILES
do
    echo ln -s "$PWD/$FILE" "~/.$FILE"
    ln -s "$PWD/$FILE" "~/.$FILE"
done
