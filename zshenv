#proxy=http://localhost:8080
#export http_proxy=$proxy
#export https_proxy=$proxy
#export HTTP_PROXY=$proxy
#export no_proxy=127.0.0.1,localhost
#export NO_AT_BRIDGE=1

export DISPLAY=:0.0

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# some addional path
export PATH="$HOME/.go/bin:$PATH"

export GOPATH=/home/user/.go
path=($HOME/.bin(N-/) $path)
path=($HOME/.go/bin(N-/) $path)

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

typeset -U path
