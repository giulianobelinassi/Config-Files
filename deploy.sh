#!/bin/bash

NVIDIA='nvidia-driver'
NVIDIA_OLD='nvidia-legacy-340xx-driver' #for GeForce 8000/9000/200 cards
NVIDIA_OPTIMUS='nvidia-driver nvidia-driver-libs-nonglvnd bumblebee-nvidia primus-libs'
PWR_MANAGER='xfce4-power-manager'

install_packages()
{
    local additional=""

    for param in "$@"; do
        if [ $param == "nvidia" ]; then
            additional="$additional $NVIDIA"
        elif [ $param == "nvidia-optimus" ]; then
            additional="$additional $NVIDIA_OPTIMUS"
        elif [ $param == "nvidia-old" ]; then
            additional="$additional $NVIDIA_OLD"
        elif [ $param == "power-manager" ]; then
            additional="$additional $PWR_MANAGER"
        fi
    done
   
    echo "additional: $additional"

    sudo apt -y install lightdm \
                 jwm \
                 pulseaudio \
                 aptitude \
                 xterm \
                 network-manager \
                 vim \
                 tmux \
                 firefox-esr \
                 network-manager \
                 network-manager-gnome \
                 volumeicon-alsa \
                 pavucontrol \
                 x11-xserver-utils \
                 audacious \
                 gcc \
                 gfortran \
                 g++ \
                 linux-headers-amd64 \
                 mesa-utils \
                 freeglut3-dev \
                 xscreensaver \
                 neomutt \
                 gnome-screenshot \
                 vlc \
                 htop \
                 conky \
                 subversion \
                 hexchat \
                 mirage \
                 gimp \
                 okular \
                 lxrandr \
                 feh \
                 gnome-screenshot \
                 $additional
}

move_configs()
{
    cp -f $PWD/files/jwmrc $HOME/.jwmrc
    cp -f $PWD/files/vimrc $HOME/.vimrc
    cp -f $PWD/files/xscreensaver $HOME/.xscreensaver
    cp -f $PWD/files/Xresources $HOME/.Xresources 
    cp -f $PWD/files/bashrc $HOME/.bashrc
    cp -f $PWD/files/bash_aliases $HOME/.bash_aliases
    cp -f $PWD/files/jwmapp $HOME/.jwmapp

    cp -rf $PWD/files/vim $HOME/.vim

    mkdir -p $HOME/.config/volumeicon/
    cp -f $PWD/files/volumeicon $HOME/.config/volumeicon/volumeicon

    mkdir -p $HOME/.config/hexchat
    cp -rf $PWD/files/hexchat $HOME/.config/hexchat

    mkdir -p $HOME/.config/conky
    cp -f $PWD/files/conky.conf $HOME/.config/conky/conky.conf

    mkdir -p $HOME/.config/xfce4/xfconf/xfce-perchannel-xml
    cp -f $PWD/files/xfce4-power-manager.xml $HOME/.config/xfce4/xfconf/xfce-perchannel-xml
}

install_packages $@
move_configs
