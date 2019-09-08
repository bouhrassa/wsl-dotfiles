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

#Nodejs 10
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -

# Yarn 
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list


sudo apt update -y
sudo apt upgrade -y
sudo apt install -y build-essential nodejs python3 python3-pip fonts-firacode yarn
sudo apt autoremove -y 
sudo yarn global add eslint prettier eslint-plugin-prettier eslint-config-prettier