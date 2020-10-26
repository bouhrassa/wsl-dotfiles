#!/bin/bash

# windows user directory
# WINHOME=$(cmd.exe /C "cd /D %USERPROFILE% && bash.exe -c pwd")

# dotfiles directory
dotfilesdir=~/wsl-dotfiles

# list of files/folders to symlink in home
dotfiles="bashrc gitconfig profile eslintrc prettierrc"

# create symlinks (will overwrite old dotfiles)
for file in ${dotfiles}; do
    echo "Creating symlink to $file in home directory."
    sudo ln -sf ${dotfilesdir}/.${file} ~/.${file}
done    

# update and install package lists
echo "Updating and installing packages"

# Font-firaCode
sudo add-apt-repository universe

#Nodejs
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
nvm install node --lts

sudo apt update -y
sudo apt upgrade -y
sudo apt install -y build-essential nodejs python3 python3-pip python3-venv fonts-firacode
sudo apt autoremove -y 
sudo npm install -g eslint prettier eslint-plugin-prettier eslint-config-prettier