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
    base-devel
    brightnessctl
    cheese
    cmake
    emacs
    fd
    feh
    freerdp
    fuse
    fzf
    git
    gmime3
    grub
    htop
    isync
    linux
    linux-firmware
    lshw
    man-db
    man-pages
    neofetch
    networkmanager
    ntfs-3g
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
    texlive-lang
    texlive-most
    tk
    tmux
    ttf-liberation
    unrar
    unzip
    vim
    wget
    xapian-core
    xf86-input-wacom
    xorg
    xorg-xinit
    zathura
    zathura-pdf-mupdf
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
    okular
    remmina
    signal-desktop
    virtualbox
    vlc
)

PACKAGE_LIST_EXTRA=(
    desmume
    dolphin-emu
    mupen64plus
    pcsx2
    steam
    vbam-wx
)

echo "Select package list to be installed:"
echo "0) Abort."
echo "1) Core package list."
echo "2) Advanced package list."
echo "3) Extra package list."
echo "4) Full package list."
echo "Type respective number:"

read CHOICE

case $CHOICE in
    0)
        echo "Installation aborted."
        ;;
    1)
        for name in "${PACKAGE_LIST_CORE[@]}"; do
            install_package $name
        done
        systemctl --user enable --now emacs
        systemctl enable NetworkManager
        xdg-mime default org.pwmt.zathura.desktop application/pdf
        ;;
    2)
        for name in "${PACKAGE_LIST_ADVANCED[@]}"; do
            install_package $name
        done
        ;;
    3)
        sudo echo "[multilib]" >> /etc/pacman.conf
        sudo echo "Include = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf
        sudo pacman -Sl --noconfirm --needed multilib
        for name in "${PACKAGE_LIST_EXTRA[@]}"; do
            install_package $name
        done
        ;;
    4)
        for name in "${PACKAGE_LIST_CORE[@]}"; do
            install_package $name
        done
        xdg-mime default org.pwmt.zathura.desktop application/pdf

        for name in "${PACKAGE_LIST_ADVANCED[@]}"; do
            install_package $name
        done

        echo "[multilib]" >> /etc/pacman.conf
        echo "Include = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf
        sudo pacman -Sl --noconfirm --needed multilib
        for name in "${PACKAGE_LIST_EXTRA[@]}"; do
            install_package $name
        done
        ;;
    *)
        echo "Wrong input. Please select correct number!"
        ;;
esac
