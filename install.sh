#!/bin/bash
echo 'Functions available:'
echo -e "    - ${GREEN}install_vim_plug${RESET}"
echo -e "    - ${GREEN}symlink_dotfiles${RESET}"
echo -e "    - ${GREEN}symlink_nvim${RESET}"
echo -e "    - ${GREEN}symlink_kitty${RESET}"
echo ''

# directories
dotfiles=~/dotfiles
olddir=~/dotfiles_old
nvim_folder=~/.config/nvim
kitty_folder=~/.config/kitty

function install_vim_plug() {
    echo "Installing vim-plug"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

function symlink_dotfiles() {
    mkdir -p $olddir
    files=(vimrc zshrc tmux.conf gitconfig bashrc inputrc dircolors.ansi-dark)
    for file in $files
    do
        mv ~/.$file $olddir &> /dev/null
        echo "Creating symlink to $file in home directory."
        ln -s ${dotfiles}/$file ~/.$file
    done
}

function symlink_nvim() {
    mkdir -p "${olddir}/nvim"
    mkdir -p $nvim_folder
    mv ${nvim_folder}/* "${olddir}/nvim"
    symlinks=(init.lua lua after)
    for f in $symlinks
    do
        ln -s "${dotfiles}/nvim/$f" "${nvim_folder}/$f" 
    done
}

function symlink_kitty() {
    mkdir -p "${olddir}/kitty"
    mv ${kitty_folder}/* "${olddir}/kitty"
    symlinks=(kitty.conf homerours.conf)
    for f in $symlinks
    do
        ln -s "${dotfiles}/kitty/$f" "${kitty_folder}/$f" 
    done
}
