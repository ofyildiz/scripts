#!/bin/sh

git clone https://github.com/ofyildiz/dwm
git clone https://github.com/ofyildiz/st
git clone https://github.com/ofyildiz/dmenu
git clone https://github.com/ofyildiz/slock
git clone https://github.com/ofyildiz/slstatus

cd ~/dwm
sudo make clean install
cd ~/st
sudo make clean install
cd ~/dmenu
sudo make clean install
cd ~/slock
sudo make clean install
cd ~/slstatus
sudo make clean install

cd ~
git clone https://github.com/ofyildiz/wallpapers
git clone https://github.com/ofyildiz/dotfiles
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
mv ~/.doom.d ~/.doom.d.bak
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mv ~/.zshrc ~/.zshrc.bak
chsh -s /bin/zsh

cd ~/dotfiles
stow doom
stow feh
stow git
stow xinit
stow zsh

cd ~
export WORKON_HOME=~/virtualenvs
mkdir -p $WORKON_HOME
source /usr/bin/virtualenvwrapper.sh
mkvirtualenv py3
pip install ipython scipy numpy pandas matplotlib scikit-rf scikit-learn sympy chaospy
deactivate
