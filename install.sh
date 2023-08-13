#!/bin/bash

echo -e "\n-------------------------------------" 
echo -e "|${CYAN}   Installing homerours dotfiles${RESET}   |"
echo -e "-------------------------------------\n" 

echo 'Functions available:'
echo -e "    - ${GREEN}install_vim_plug${RESET}"
echo -e "    - ${GREEN}install_packer${RESET}"
echo -e "    - ${GREEN}symlink_dotfiles${RESET}"
echo -e "    - ${GREEN}symlink_nvim${RESET}"
echo -e "    - ${GREEN}symlink_kitty${RESET}"
echo ''

function install_vim_plug() {
    echo "Installing vim-plug"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

function install_packer() {
    git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
}

function symlink_dotfiles() {
	dir=~/dotfiles                    # dotfiles directory
    olddir=~/dotfiles_old             # old dotfiles backup directory
    mkdir -p $olddir

    files=(vimrc zshrc tmux.conf gitconfig bashrc inputrc dircolors.ansi-dark)
    for file in $files
    do
        mv ~/.$file $olddir &> /dev/null
        echo "Creating symlink to $file in home directory."
        ln -s $dir/$file ~/.$file
    done
}

function symlink_nvim() {
	dir=~/dotfiles
    olddir=~/dotfiles_old
    nvim_folder=~/.config/nvim
    mkdir -p "${olddir}/nvim"
    mkdir -p $nvim_folder
    mv ${nvim_folder}/* "${olddir}/nvim"
    symlinks=(init.lua lua after)
    for f in $symlinks
    do
        ln -s "${dir}/nvim/$f" "${nvim_folder}/$f" 
    done
}

function symlink_kitty() {
	dir=~/dotfiles
    olddir=~/dotfiles_old
    kitty_folder=~/.config/kitty
    mkdir -p "${olddir}/kitty"
    mv ${kitty_folder}/* "${olddir}/kitty"
    symlinks=(kitty.conf homerours.conf)
    for f in $symlinks
    do
        ln -s "${dir}/kitty/$f" "${kitty_folder}/$f" 
    done
}
