#!/bin/bash

packagelist=(
    "zsh"
    "zplug"
    "tmux"
    "npm"
    
    "emacs-mozc"

    "build-essential"
    "cmake"
    "cmigemo"
    "ruby"
    "rubocop"
    "golang"

    "tree"
    "fontforge"
)

echo "start apt install apps..."
for list in ${packagelist[@]}; do
    sudo apt install -y ${list}
done

sudo apt update
sudo apt upgrade
