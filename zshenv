#proxy=http://localhost:8080
#export http_proxy=$proxy
#export https_proxy=$proxy
#export HTTP_PROXY=$proxy
#export no_proxy=127.0.0.1,localhost
export NO_AT_BRIDGE=1

export DISPLAY=:0.0
export GOPATH=/home/user/.go

path=($HOME/.bin(N-/) $path)
path=($HOME/.go/bin(N-/) $path)
typeset -U path
