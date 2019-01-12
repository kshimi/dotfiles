#!/bin/sh

# install packages

sudo add-apt-repository ppa:martin-frost/thoughtbot-rcm

packagelist=(
    "zsh"
    "zplug"
    "autojump"
    "tmux"
#    "npm"
    "rcm"
    
#    "emacs-mozc"

    "build-essential"
    "cmake"
    "cmigemo"
    "ruby"
    "rubocop"
    "golang"

#    "tree"
#    "fontforge"
)

echo "start apt install apps..."
for list in ${packagelist[@]}; do
    sudo apt install -y ${list}
done

sudo apt update
sudo apt upgrade

# setup rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
(cd ~/.rbenv && src/configure && make -C src)
mkdir -p "$(rbenv root)"/plugins
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

git clone https://github.com/kshimi/dotfiles.git $HOME/.dotfiles
bash $HOME/dotfiles/etc/setup_go.sh
env RCRC=$HOME/.dotfiles/rcrc rcup

sudo chsh -s $(which zsh)
