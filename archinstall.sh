#!/bin/sh

install_package() {
    if pacman -Qi $1 &> /dev/null; then
        echo "Package $1 is already installed!"
    else
        sudo pacman -S --noconfirm --needed $1
    fi
}

PACKAGE_LIST_CORE=(
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

PACKAGE_LIST_ADVANCED=(
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

echo "Select package list to be installed:\n"
echo "0) Abort."
echo "1) Core package list."
echo "2) Advanced package list."
echo "3) Full package list.\n"
echo "Type respective number:"

read CHOICE

case $CHOICE in
    0)
        echo "Installation aborted.\n"
        ;;
    1)
        for name in "${PACKAGE_LIST_CORE[@]}"; do
            install_package $name
        done
        ;;
    2)
        for name in "${PACKAGE_LIST_ADVANCED[@]}"; do
            install_package $name
        done
        ;;
    3)
        for name in "${PACKAGE_LIST_CORE[@]}"; do
            install_package $name
        done
        for name in "${PACKAGE_LIST_ADVANCED[@]}"; do
            install_package $name
        done
        ;;
    *)
        echo "Wrong input. Please select correct number!\n"
        ;;
esac
