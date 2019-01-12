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

bash -c "$(cat ${DOTPATH}/etc/setup_go.sh)"

# setup rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
(cd ~/.rbenv && src/configure && make -C src)

# setup ruby-build
mkdir -p ~/.rbenv/plugins
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

