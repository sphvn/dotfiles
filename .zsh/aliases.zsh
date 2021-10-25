# Standard
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias less='less -R'
alias rm='rm -i'                              # confirm removal
alias cp='cp -i'                              # confirm copy
alias mv='mv -i'                              # confirm move
alias ls='ls -G'                              # colorize `ls` output
alias grep='grep --color=auto'                # colorize `grep` output
alias zshrc='vi ~/.zshrc'

# Fzf Fu
switch-branch () {
  S_BRANCH=$(git for-each-ref --sort=-committerdate --format="%(refname)" refs/heads | fzf --preview="git log {}")
  if [ ! -z "S_BRANCH" ]
  then
    R_BRANCH=$(echo $S_BRANCH | sed -e 's@refs/heads/@@')
    if [ ! -z "$R_BRANCH" ]
    then
      git checkout $R_BRANCH
    fi
  fi
}

switch-remote-branch () {
  git fetch -p
  S_BRANCH=$(git for-each-ref --sort=-committerdate --format="%(refname)" refs/remotes | fzf --preview="git log {}")
  if [ ! -z "S_BRANCH" ]
  then
    R_BRANCH=$(echo $S_BRANCH | sed -e 's@refs/remotes/@@')
    if [ ! -z "$R_BRANCH" ]
    then
      git checkout $R_BRANCH
    fi
  fi
}

show() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}

# Git Fu
alias g='git'
alias a="git add"
alias b="git branch"
alias c="git commit"
alias cm="git checkout origin/master"
alias cs="show"
alias d="git diff"
alias f="git fetch --prune"
alias p="git push origin"
alias r="git reset"
alias rh="git reset --hard"
alias su="git submodule update"
alias s="switch-branch"
alias sr="switch-remote-branch"
alias t="git status"
alias v="vim"
alias vs="code"
# alias x="npm i && npm run build"
# alias xx="rm -rf node_modules && x"
# alias z="npm run start"
# alias zz="xx && z"

