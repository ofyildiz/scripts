#!/bin/sh

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
    steam
    virtualbox
)

for name in "${package_list_core[@]}"; do
    install_package $name
done

for name in "${package_list_advanced[@]}"; do
    install_package $name
done

# TODO

# git dwm
# git st
# git dmenu
# git slock
# git slstatus
# install

# git dotfiles
# git wallpapers
# git docs
# git gtemp
# git myblog
# stow

# python (ipython, numpy, scipy, pandas, matplotlib, chaospy, scikit-rf, scikit-learn, sympy)
# ohmygzsh
# emacs doom
