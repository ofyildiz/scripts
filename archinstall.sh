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
    cheese
    emacs
    fzf
    gcc
    git
    htop
    isync
    libwacom
    make
    neofetch
    networkmanager
    pandoc
    pass
    pdftk
    python
    python-pip
    python-virtualenv
    python-virtualenvwrapper
    qutebrowser
    ranger
    rsync
    ruby
    stow
    texlive-most
    texlive-lang
    tmux
    vim
    xf86-input-wacomk
    xorg
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
