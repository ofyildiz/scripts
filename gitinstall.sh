#!/bin/sh

CWD=$PWD

git clone https://github.com/ofyildiz/dwm ~/dwm
git clone https://github.com/ofyildiz/st ~/st
git clone https://github.com/ofyildiz/dmenu ~/dmenu
git clone https://github.com/ofyildiz/slock ~/slock
git clone https://github.com/ofyildiz/slstatus ~/slstatus

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

cd $CWD
