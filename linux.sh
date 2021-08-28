#!/usr/bin/env bash

# A script to install wanted software on my system
# It is by no means perfect nor clean, but who cares, if it works.
# If it doesn't work, please open an issue.


if ! command -v pacman &> /dev/null; then
    echo -e "Sorry mate!\nArchLinux and Arch based distros only at the moment.\nFeel free to port it to other distros :D."
fi

# If you just wan't to install other packages, edit these two lines
packages="neovim kitty i3 dunst rofi python-pywal python-pip firefox gnome-keyring seahorse libgnome-keyring zenity blueberry networkmanager pavucontrol autorandr xrandr arandr lightdm lightdm-webkit2-greeter lightdm-webkit-theme-litarvan github-cli" # gnome touchegg

aur_packages="ttf-twemoji mimeo xdg-utils-mimeo nerd-fonts-jetbrains-mono nerd-fonts-iosevka betterlockscreen deezer rofi-autorandr" # mimeo because xdg-open without a DE is f*cked up

_exists() {
    if command -v pacman &> /dev/null; then
        pacman -Q ${@} &> /dev/null
    else
        echo "uhm.. sorry but WHAT?!?!?!"
        exit 1
    fi
}

_install() {
    program=${@}
    echo -e "Installing ${program}..."
    if _exists pacman; then
        sudo pacman -S $program
    fi
}

_aur_install() {
    program=${@}
    if ! _exists $program; then
        paru -S $program
    fi
}

post_install() {
    # pip
    # ---
    python3 -m ensurepip
    # ---
    sleep 1

    # --------
    # pywalfox
    # --------
    pip3 install pywalfox
    pywalfox install
    echo -e "Install the pywalfox firefox extension!"
    echo "https://addons.mozilla.org/en-GB/firefox/addon/pywalfox/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search"
    # --------
    sleep 1

    # --------------
    # networkmanager
    # --------------
    echo -e "Enabling NetworkManager..."
    echo sudo systemctl enable NetworkManager
    sleep 0.5
    sudo systemctl enable NetworkManager
    # --------------
    sleep 1

    # ---------------
    # betterlockscreen
    # ---------------
    echo -e "Enabling betterlockscreen lock on suspend..."
    echo sudo systemctl enable betterlockscreen@$USER
    sudo systemctl enable betterlockscreen@$USER
    # ---------------
    sleep 1
    
    # -------
    # lightdm
    # -------
    echo -e "Enabling lightdm"
    echo sudo systemctl enable lightdm-plymouth
    sudo systemctl enable lightdm-plymouth
    # thanks https://github.com/manilarome/lightdm-webkit2-theme-glorious
    sudo sed -i 's/^\(#?greeter\)-session\s*=\s*\(.*\)/greeter-session = lightdm-webkit2-greeter #\1/ #\2g' /etc/lightdm/lightdm.conf
    sudo sed -i 's/^webkit_theme\s*=\s*\(.*\)/webkit_theme = litarvan #\1/g' /etc/lightdm/lightdm-webkit2-greeter.conf
}

aur_helper_install() {
    if _exists pacman && ! _exists yay && ! _exists paru && ! _exists yoghurt; then
        echo "You have no AUR manager installed on your system."
        echo "paru is an AUR helper written in Rust and an alternative to yay"
        echo "Do you wan't to install paru? [y/N]"
        read answer
        if [[ ${answer,,} == "n" || ${answer,,} == "no" ]]; then
            echo "OK! Skipping..."
        else
        echo Cloning...
        git clone https://aur.archlinux.org/paru-bin.git $HOME/paru-bin
        sleep 1

        echo Entering the home directory...
        cd $HOME/paru-bin
        sleep 1

        echo Making package...
        makepkg -si
        sleep 1
        echo DONE!
        fi
    fi
}

install_packages() {
    if [[ $packages != "" ]]; then
        _install $packages
    fi

    if [[ $aur_packages != "" ]]; then
        _aur_install $packages
    fi
}


main() {
    echo "Welcome to the Dotfiles!"
    sleep 1.5
    echo "Have a look around,"
    sleep 1.5
    echo "Anything that brain of your can think of can be found,"
    sleep 1.5
    echo "We have mountains of configs"
    sleep 1.5
    echo "some better, some worse."
    sleep 1.5
    echo "if none of it's of interest to you you wouldn't be the first"
    sleep 1.5
    echo "Welcome to the Dotfiles!"
    sleep 1
    echo "https://youtu.be/k1BneeJTDcU"
    aur_helper_install

    sleep 1
    install_packages

    sleep 1
    post_install

    sleep 1
    echo "Done!"
    echo "you should have a somewhat working system now"
}

main
# vim:foldmethod=marker
