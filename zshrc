# Set up the prompt
setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long

autoload -Uz colors
colors

stty stop undef
setopt nobgnice
setopt extended_glob
setopt AUTO_CD

export EDITOR='emacsclient'

#aliases
alias ec='emacsclient $*'
alias ls='ls --color=auto'

# autojump
source /usr/share/autojump/autojump.sh

# zplug
source /usr/share/zplug/init.zsh

zplug "zsh-users/zsh-syntax-highlighting"
zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf
zplug "junegunn/fzf", as:command, use:bin/fzf-tmux
zplug mafredri/zsh-async, from:github
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme
zplug "matsub/zshtools", from:bitbucket
zplug "joel-porquet/zsh-dircolors-solarized", from:github, hook-load:"setupsolarized dircolors.256dark"
zplug plugins/z, from:oh-my-zsh
zplug andrewferrier/fzf-z
zplug andrewferrier/fzf-z, as:command, use:fzfz

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi
# Then, source plugins and add commands to $PATH
zplug load

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.fzf.zsh.local ] && source ~/.fzf.zsh.local

# some addional path
export PATH="$HOME/.go/bin:$PATH"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
typeset -U path
eval "$(rbenv init -)"

cd $HOME
