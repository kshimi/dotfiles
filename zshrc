# Set up the prompt
setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

[ `uname` = "Darwin" ] && export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

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

### Added by Zinit's installer
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

zinit light zsh-users/zsh-syntax-highlighting
zinit ice; zinit light junegunn/fzf
zinit ice from"gh-r" as"program"; zinit light junegunn/fzf-bin
zinit ice; zinit light mafredri/zsh-async
zinit ice pick"async.zsh" src"pure.zsh"; zinit light sindresorhus/pure
zinit ice; zinit light andrewferrier/fzf-z
zinit ice from"bb"; zinit light matsub/zshtools
zinit ice atload'setupsolarized dircolors.256dark'; zinit light joel-porquet/zsh-dircolors-solarized
#zinit snippet OMZ::plugins/z/z.sh

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.fzf.zsh.local ] && source ~/.fzf.zsh.local

export FZFZ_EXCLUDE_PATTERN="\/.(bundle|cache|config|dbus|git)"

typeset -U path PATH

cd $HOME
