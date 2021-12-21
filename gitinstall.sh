#!/bin/sh

CWD=$PWD

# install suckless utilities
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

# install doom emacs
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
mv ~/.doom.d ~/.doom.d.bak

# install orca (c99 in terminal)
git clone https://github.com/hundredrabbits/Orca-c.git ~/Orca-c
cd ~/Orca-c
make

# install orca (javascript with electron)
git clone https://github.com/hundredrabbits/Orca.git ~/Orca
cd ~/Orca/desktop/
npm install
cd ~

# install orca examples
git clone https://git.sr.ht/~rabbits/orca-examples ~/Orca-examples

# install ticker
curl -Ls https://api.github.com/repos/achannarasappa/ticker/releases/latest \
| grep -wo "https.*linux-amd64*.tar.gz" \
| wget -qi - \
&& tar -xf ticker*.tar.gz \
&& chmod +x ./ticker \
&& sudo mv ticker /usr/local/bin/

# install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
mv ~/.zshrc ~/.zshrc.bak
chsh -s /bin/zsh

# install public git repositories
GIT_LIST=(
    dotfiles
    wallpapers
)

for name in "${GIT_LIST[@]}"; do
    git clone $GIT_URL/$name ~/$name
done

cd ~/dotfiles
stow *

~/.emacs.d/bin/doom sync

cd $CWD
