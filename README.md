# My development DE
An install script, that installs sway, neovim, emacs, rofi, and other usefull files and configs for ***fedora***.
# Intruduction:

This is a small install script that installs sway enviorment and install configurations for the enviorment.


# Install:

If you do not have installed lsb<sub>release</sub>, then run

```command
sudo dnf install redhat-lsb-core
```


## Download

To download the script run:

```command
git clone https://github.com/RozsaBotond/sway-enviorment.git
```


# Usage:

Run:

```command
cd sway-enviorment

./install
```

and answer to the message ,from your package message.


## Disclamer:

You have to have fedora system and it will ask you for your password!


## Warning:

Your previous configs will be deleted, pleas make sore to backup your configs.

Example:

```command
mv .config/nvim/init.vim .config/nvim/old_init.vim
```


# Sript documentations:


## Sudo privilige check:

```bash
if (( "$EUID" == 0 )); then
    echo "Please do not run as root"
    exit
fi
```


## System check:

```bash
if [[ $(lsb_release -is) == "Fedora" ]]
```


## Folder check:

```bash
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
```


## Install:

```bash
sudo dnf install neovim nodejs -y
sudo npm install -g yarn
pip3 install pynvim
cp init.vim $HOME/.config/nvim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Feel free to contribute.
