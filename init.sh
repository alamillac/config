#!/bin/bash

DOTFILES="i3 i3status.conf ssh/config vimrc zshrc pylintrc"

echo "Se han de instalar las siguientes dependencias:"
echo "apt install i3 i3status keepassx vim tmux zsh silversearcher-ag ack-grep pavucontrol arandr build-essential vim-nox curl"

echo "Instalar linters para python y js"
echo "apt install pylint"

echo "Instalar nodejs"
echo "curl -sL https://deb.nodesource.com/setup_10.x | bash -"
echo "apt install nodejs"
echo "npm install -g eslint"

echo "Instalar slim (login manager)"
echo "apt install slim"

echo "Instalar autolock"
echo "apt-get install xautolock imagemagick"

echo "Instalar skype"
echo "wget -O skype-install.deb http://www.skype.com/go/skypeforlinux-64.deb"
echo "gdebi skype-install.deb"

echo "Instalar oh-my-zsh"
echo "https://github.com/robbyrussell/oh-my-zsh"
echo 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"'

echo "Creando enlaces simbolicos"
for FILE in $DOTFILES
do
    echo ln -s "$PWD/$FILE" "~/.$FILE"
    ln -s "$PWD/$FILE" ~/.$FILE
done

# Bin files
echo ln -s "$PWD/bin" "~/bin"
ln -s "$PWD/bin" ~/bin

exit

echo "Instalando plugins de vim"
echo "Instalando Vundle"
# install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +BundleInstall

echo "Instalando YouCompleteMe"
# install YCM
echo "sudo ln -s /usr/bin/nodejs /usr/bin/node"
echo "apt install cmake python-dev"
cd ~/.vim/bundle/YouCompleteMe
./install.py --tern-completer
cd

# install entr
echo "Instalar entr para ejecutar test python cuando haya un cambio en un archivo py"
echo "apt install entr"
