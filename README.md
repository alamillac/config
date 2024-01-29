# config

Base configuration files of my ubuntu desktop

## Getting Started

### Installing

Execute the init.sh script, to create the symbolic links to config files, and then install all the desired tools.

#### Linux dependencies

```
apt install i3 i3status keepassx vim tmux zsh silversearcher-ag ack-grep pavucontrol arandr build-essential vim-nox curl lxterminal bat exa zoxide
```

nvim telescope dependencies for fuzzy finder
```
apt install ripgrep fd-find
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

#### ZIM (zsh)

More info [here](https://zimfw.sh/)

```
chsh -s $(which zsh) # Cambia la shell a zsh por defecto
curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
```

#### Latex

```
apt-get install texlive texlive-latex-extra python-pygments
```

#### Neovim

Download nvim https://github.com/neovim/neovim/releases/tag/stable

Install package manager [packer](https://github.com/wbthomason/packer.nvim)

```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

In nvim:

From packer.lua in nvim config files
```
:source
:PackerSync
```

Optional, install all parsers from treesitter
```
:TSInstall all 
:TSUpdate
```

Check installation
```
:checkhealth
```

Alias vim to nvim in .bashrc

```
alias vim="nvim"
alias vi="nvim"
```
alias oldvim="vim"
```

[Nice video](https://www.youtube.com/watch?v=w7i4amO_zaE&list=PLm323Lc7iSW_wuxqmKx_xxNtJC_hJbQ7R&index=6)

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

#### Install meld

Meld, compara archivos y carpetas de forma gráfica

```
apt install meld
```

### Config

#### keymap

For spanish keyboard

```
setxkbmap es
```

For us keyboard

```
setxkbmap us
```

or

```
setxkbmap -layout us -variant intl
```

Edit **/etc/X11/xorg.conf.d/00-keyboard.conf** to make it permanently

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

### Play tone after some seconds
```
sleep 10 && paplay /usr/share/sounds/freedesktop/stereo/message-new-instant.oga
sleep 10 && paplay /usr/share/sounds/freedesktop/stereo/bell.oga
```

### Search for directories
#### Fuzzy finder
Install from [repo](https://github.com/junegunn/fzf#installation) to have last version and autocomplete in bash

Run the following to use it:
```
fzf
```

#### Rip grep
```
rg PATTERN 
```

### Load tests
[ddosify docs](https://github.com/ddosify/ddosify/tree/master/engine_docs)

```
ddosify -t http://target_site.com -o stdout-json | jq .avg_duration
```

### Install Alacritty and set as the default terminal-emulator 
Follow the [install](https://github.com/alacritty/alacritty/blob/master/INSTALL.md) instructions

Set alacritty as the default terminal with the following command
```
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator $(which alacritty) 50
sudo update-alternatives --config x-terminal-emulator
```

Patched font for tmux [here](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/FiraCode.zip). More fonts [here](https://www.nerdfonts.com/font-downloads)
Extract into ~/.local/share/fonts/firacode

```
fc-cache -f -v # To update cache fonts
fc-list # To list all the fonts
```

For true colors read [here](https://gist.github.com/andersevenrud/015e61af2fd264371032763d4ed965b6)

Configurations settings can be obtained [here](https://github.com/alacritty/alacritty/blob/master/extra/man/alacritty.5.scd)

### Install Tmux Plugin Manager (TPM)
The instructions can be found [here](https://github.com/tmux-plugins/tpm#installation)

First download the repo
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

And then to install the plugins:
'Ctl+b + I'
inside a tmux session
