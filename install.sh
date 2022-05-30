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
    sudo dnf install neovim nodejs -y
    sudo npm install -g yarn
    pip3 install pynvim
    cp init.vim $HOME/.config/nvim
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
else
    echo "ERROR: Can't install on this distribution or wrong Distributor ID. (Supported: Fedora)";
    exit
fi

