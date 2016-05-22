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

echo "Instalando nodejs y npm"
echo TODO
exit

echo "Instalando plugins de vim"
echo "Instalando Vundle"
# install vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall

echo "Instalando YouCompleteMe"
# install YCM
cd ~/.vim/bundle/YouCompleteMe
./install.sh --tern-completer
cd
