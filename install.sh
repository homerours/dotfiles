#!/bin/sh
set -e

DOTFILES="$HOME/dotfiles"
BACKUP="$HOME/dotfiles_old"
GREEN="\033[0;32m"
RED="\033[0;31m"
RESET="\033[m"

info() { printf "${GREEN}[+]${RESET} %s\n" "$1"; }
warn() { printf "${RED}[!]${RESET} %s\n" "$1"; }

link() {
    src="$1"
    dst="$2"
    if [ -L "$dst" ]; then
        rm "$dst"
    elif [ -e "$dst" ]; then
        mkdir -p "$BACKUP"
        mv "$dst" "$BACKUP/$(basename "$dst").$(date +%s)"
        warn "Backed up existing $dst"
    fi
    ln -s "$src" "$dst"
    info "Linked $dst -> $src"
}

symlink_dotfiles() {
    for file in bashrc zshrc tmux.conf gitconfig inputrc dircolors.ansi-dark vscodevimrc; do
        [ -f "$DOTFILES/$file" ] && link "$DOTFILES/$file" "$HOME/.$file"
    done
}

symlink_nvim() {
    mkdir -p "$HOME/.config/nvim"
    for f in init.lua lua; do
        [ -e "$DOTFILES/nvim/$f" ] && link "$DOTFILES/nvim/$f" "$HOME/.config/nvim/$f"
    done
}

symlink_kitty() {
    mkdir -p "$HOME/.config/kitty"
    for f in kitty.conf homerours.conf; do
        [ -e "$DOTFILES/kitty/$f" ] && link "$DOTFILES/kitty/$f" "$HOME/.config/kitty/$f"
    done
}

usage() {
    echo "Usage: ./install.sh [target...]"
    echo ""
    echo "Targets:"
    echo "  all         Install everything"
    echo "  dotfiles    Symlink shell dotfiles (bashrc, zshrc, ...)"
    echo "  nvim        Symlink neovim config"
    echo "  kitty       Symlink kitty config"
    echo ""
    echo "With no arguments, installs everything."
}

if [ $# -eq 0 ]; then
    set -- all
fi

for target in "$@"; do
    case "$target" in
        all)
            symlink_dotfiles
            symlink_nvim
            symlink_kitty
            ;;
        dotfiles)  symlink_dotfiles ;;
        nvim)      symlink_nvim ;;
        kitty)     symlink_kitty ;;

        -h|--help) usage; exit 0 ;;
        *)         warn "Unknown target: $target"; usage; exit 1 ;;
    esac
done

info "Done!"
