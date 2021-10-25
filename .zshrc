path=('/usr/local/bin' $path)
export PATH

export ZSH=$HOME/.oh-my-zsh
source $HOME/.zsh/aliases.zsh

ZSH_THEME="agnoster"

plugins=(git)

source $ZSH/oh-my-zsh.sh

DISABLE_AUTO_UPDATE=true
DISABLE_UPDATE_PROMPT=true
