#!/usr/bin/env bash

function install-oh-my-zsh {
  if ! command -v zsh &> /dev/null
  then
    echo "zsh not found, installing"
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    exit
  fi  
}

function symlink-dotfiles {
  files="zshrc zsh gitignore"
  for file in ${files}; do
    echo "Symlinking $PWD/.${file} to ${HOME}/.${file}"
    ln -sf $PWD/.${file} ${HOME}/.${file}
  done
}

function install-fzf {
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install --all
}

install-oh-my-zsh
symlink-dotfiles
install-fzf
