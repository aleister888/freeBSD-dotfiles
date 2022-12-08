#!/bin/sh
mkdir $HOME/.local/scripts; stow --target=${HOME}/.local/scripts/ scripts/
mkdir $HOME/.config; stow --target=${HOME}/.config/ .config/
