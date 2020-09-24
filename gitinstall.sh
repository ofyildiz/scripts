#!/bin/sh

CWD=$PWD

GIT_URL=https://github.com/ofyildiz

install_suckless() {
    git clone $GIT_URL/$1 ~/$1
    cd ~/$1
    sudo make clean install
}

SUCKLESS_LIST=(
    dwm
    st
    dmenu
    slock
    slstatus
)

for name in "${SUCKLESS_LIST[@]}"; do
    install_suckless $name
done

git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
mv ~/.doom.d ~/.doom.d.bak

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
mv ~/.zshrc ~/.zshrc.bak
chsh -s /bin/zsh

GIT_LIST=(
    dotfiles
    org
    wallpapers
)

for name in "${GIT_LIST[@]}"; do
    git clone $GIT_URL/$name ~/$name
done

cd ~/dotfiles
stow *

~/.emacs.d/bin/doom sync

cd $CWD
