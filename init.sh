#!/bin/bash

DOTFILES="i3 i3status.conf ssh/config vimrc zshrc pylintrc"

echo "Se han de instalar las siguientes dependencias:"
echo "apt-get install i3 vim tmux zsh silversearcher-ag ack-grep"

echo "Instalar linters para python y js"
echo "apt install pylint"
echo "sudo npm install -g eslint"

echo "Creando enlaces simbolicos"
for FILE in $DOTFILES
do
    echo ln -s "$PWD/$FILE" "~/.$FILE"
    ln -s "$PWD/$FILE" ~/.$FILE
done

# Bin files
echo ln -s "$PWD/bin" "~/bin"
ln -s "$PWD/bin" ~/bin

echo "Instalando nodejs y npm"
echo TODO
exit

echo "Instalando plugins de vim"
echo "Instalando Vundle"
# install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +BundleInstall

echo "Instalando YouCompleteMe"
# install YCM
cd ~/.vim/bundle/YouCompleteMe
./install.sh --tern-completer
cd

# install entr
echo "Instalar entr para ejecutar test python cuando haya un cambio en un archivo py"
echo "apt install entr"
