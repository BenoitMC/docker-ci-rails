export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="risto"
export CHEATCOLORS=true

plugins=(
  extract
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

alias reload!=". ~/.zshrc"

source ~/.profile
