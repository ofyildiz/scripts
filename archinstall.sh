#!/bin/sh

cd ~
install_package() {
    if pacman -Qi $1 &> /dev/null; then
        echo 'Package '$1' is already installed!'
    else
        sudo pacman -S --noconfirm --needed $1
    fi
}

package_list_core=(
    alsa-utils
    arandr
    base
    cheese
    emacs
    fd
    feh
    fzf
    gcc
    git
    grub
    htop
    isync
    linux
    linux-firmware
    make
    man-db
    man-pages
    neofetch
    networkmanager
    pandoc
    pass
    pdftk
    pkgconf
    python-pip
    python-virtualenv
    python-virtualenvwrapper
    qutebrowser
    ranger
    ripgrep
    rsync
    ruby
    stow
    sudo
    texinfo
    texlive-most
    texlive-lang
    tmux
    vim
    xf86-input-wacom
    xorg
    xorg-xinit
    zathura
    zsh
)

package_list_advanced=(
    audacity
    firefox
    gimp
    inkscape
    kdenlive
    krita
    libreoffice-fresh
    lmms
    obs-studio
    remmina
    signal-desktop
    virtualbox
)

for name in "${package_list_core[@]}"; do
    install_package $name
done

for name in "${package_list_advanced[@]}"; do
    install_package $name
done

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

cd ~/dotfiles
stow git
stow feh
stow xinit
stow doom

cd ~
# python (ipython, numpy, scipy, pandas, matplotlib, chaospy, scikit-rf, scikit-learn, sympy)
# ohmygzsh
