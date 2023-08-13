#!/bin/zsh

olddir=~/dotfiles_old             # old dotfiles backup directory

cd ~/dotfiles
git submodule update --init prezto

mv ~/.zprezto $olddir
ln -s ~/dotfiles/prezto ~/.zprezto

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
	mv "${ZDOTDIR:-$HOME}/.${rcfile:t}" $olddir
	ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
