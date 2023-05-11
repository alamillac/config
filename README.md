# config

Base configuration files of my ubuntu desktop

## Getting Started

### Installing

Execute the init.sh script, to create the symbolic links to config files, and then install all the desired tools.

#### Linux dependencies

```
apt install i3 i3status keepassx vim tmux zsh silversearcher-ag ack-grep pavucontrol arandr build-essential vim-nox curl lxterminal neovim
```

#### DBeaver
https://dbeaver.io/download/

#### Python and Js lint

```
apt install pylint
```

To avoid false 'Unable to import' errors, edit /usr/bin/pylint and replace:

```
#!/usr/bin/python
```

with:

```
#!/usr/bin/python
```

```
# Nodejs
curl -sL https://deb.nodesource.com/setup_10.x | bash -
apt install nodejs
npm install -g eslint
```

#### Login manager (Slim)

```
apt install slim
```

#### Screen lock (Autolock)

```
apt-get install xautolock imagemagick
```

#### Skype

```
wget -O skype-install.deb http://www.skype.com/go/skypeforlinux-64.deb
gdebi skype-install.deb
```

#### Oh-my-bash

More info [here](https://github.com/ohmybash/oh-my-bash)

```
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
```

#### Oh-my-zsh

More info [here](https://github.com/robbyrussell/oh-my-zsh)

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

```

#### Latex

```
apt-get install texlive texlive-latex-extra python-pygments
```

#### Neovim

https://stsewd.dev/es/posts/neovim-installation-configuration/

Install vim-plug

```
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall
```

#### Vim plugins

Install vim-plug

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall
```

Install YouCompleteMe

```
sudo ln -s /usr/bin/nodejs /usr/bin/node
apt install cmake python-dev-is-python3
cd ~/.vim/plugged/YouCompleteMe
./install.py --tern-completer
```

#### Entr

With `entr` is possible to execute a command when a file changes. This is useful to run tests when a code file changes.

```
apt install entr
```

Example entr script for testing:

```
echo "Escuchando archivo $TFILE:"
printf "unnax/api/v2/tests/test_$TFILE\nunnax/api/v2/views/$TFILE" | entr ./manage.py test -p test_$TFILE
```

```
$ find . -name '*.py' | entr nosetests
```

#### Install desktop packages

```
apt install gimp pcmanfm evince feh scrot libnotify-bin
```

#### Wireless firmware for debian

The non-free packages should be enabled in sources.list file and then install the firmware.

```
apt-get install firmware-iwlwifi
```

#### Install pyenv

With pyenv is possible to use a specific python version.

```
curl https://pyenv.run | bash"
apt install libffi-dev"
```

Then you can use it like this:

```
pyenv install 3.7.3
pyenv shell 3.7.3
```

#### Install Visual Studio Code

Download the deb package from [here](https://code.visualstudio.com/docs/setup/linux) and install it.

```
sudo dpkg -i code_1.34.0-1557957934_amd64.deb
```

The configuration can be sync using [settings sync plugin](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync)

#### Install meld

```
apt install meld
```

### Config

#### keymap es

```
setxkbmap es
```

#### Set lxterminal font

Set font to DejaVu Sans Mono Book 11

### SSH

Port forwarding

```
ssh -f ubuntu@crypto.example.com -L 5555:localhost:5555 -N
```

### mitmproxy

Run mitmproxy

```
docker run --rm -it -p 8080:8080 -p 127.0.0.1:8081:8081 mitmproxy/mitmproxy mitmweb --web-host 0.0.0.0
```

Configure proxy in browser

Download certificates

```
firefox https://mitm.it
```
