#!/bin/bash

DOTFILES="i3 i3status.conf ssh/config vimrc zshrc pylintrc"

echo "Creando enlaces simbolicos"
for FILE in $DOTFILES
do
    echo ln -s "$PWD/$FILE" "~/.$FILE"
    ln -s "$PWD/$FILE" ~/.$FILE
done

CONFIG_DOTFILES="nvim alacritty"
for FILE in $CONFIG_DOTFILES
do
    echo ln -s "$PWD/$FILE" "~/.config/$FILE"
    ln -s "$PWD/$FILE" ~/.config/$FILE
done

# Bin files
echo ln -s "$PWD/bin" "~/bin"
ln -s "$PWD/bin" ~/bin
