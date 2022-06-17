#! /bin/bash
if (( "$EUID" == 0 )); then
    echo "Please do not run as root"
    exit
fi



if [[ $(lsb_release -is) == "Fedora" ]]
then
    echo "Installing started.."
    if [ -d "$HOME/.config" ] 
    then
        echo ".config dir exist"
    else
        echo "making .config directory"
        mkdir $HOME/.config 
    fi

    if [ -d "$HOME/.config/nvim" ] 
    then
        echo ".config/nvim dir exist"
    else
        echo "making .config/nvim directory"
        mkdir $HOME/.config/nvim
    fi

    if [ -d "$HOME/.config/sway" ]
    then
        echo ".config/sway dir exist"
    else
        echo "making .config/sway directory"
        mkdir $HOME/.config/sway
    fi

    if [ -d "$HOME/.config/rofi" ]
    then
        echo ".config/rofi dir exist"
    else
        echo "making .config/rofi directory"
        mkdir $HOME/.config/rofi
    fi
    sudo dnf install neovim nodejs python3 ripgrep fd-find sway rofi waybar gnome-terminal -y
    sudo npm install -g yarn
    python3 -m pip install --upgrade pip
    pip3 install pynvim
    cp init.vim $HOME/.config/nvim
    cp config $HOME/.config/sway/config
    cp ribbon_top.rasi $HOME/.config/rofi/ribbon_top.rasi
    cp styles -r $HOME/.config/rofi/
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
else
    echo "ERROR: Can't install on this distribution or wrong Distributor ID. (Supported: Fedora)";
    exit
fi

