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

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt update -y
sudo apt upgrade -y
sudo apt install -y build-essential nodejs python yarn
sudo apt autoremove -y 
sudo yarn global add eslint prettier eslint-config-prettier eslint-plugin-prettier eslint eslint-config-airbnb-base eslint-plugin-import