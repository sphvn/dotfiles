#!/usr/bin/env bash

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

symlink-dotfiles
install-fzf
