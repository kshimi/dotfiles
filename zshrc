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

### Added by Zplugin's installer
source "$HOME/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin's installer chunk

zplugin light zsh-users/zsh-syntax-highlighting
zplugin ice; zplugin light junegunn/fzf
zplugin ice from"gh-r" as"program"; zplugin light junegunn/fzf-bin
zplugin ice; zplugin light mafredri/zsh-async
zplugin ice pick"async.zsh" src"pure.zsh"; zplugin light sindresorhus/pure
zplugin ice; zplugin light andrewferrier/fzf-z
zplugin ice from"bb"; zplugin light matsub/zshtools
zplugin ice atload'setupsolarized dircolors.256dark'; zplugin light joel-porquet/zsh-dircolors-solarized
zplugin snippet OMZ::plugins/z/z.sh

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.fzf.zsh.local ] && source ~/.fzf.zsh.local

typeset -U path

cd $HOME
