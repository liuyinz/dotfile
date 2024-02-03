#!/usr/bin/env zsh

# Aliases
# default
# -----------------------
alias zprof='ZSH_PROFILER="true" exec zsh'

alias ls='gls -F --color --group-directories-first'
alias ll='gls -lhF --color --group-directories-first'
alias la='gls -AF --color --group-directories-first'
alias lla='gls -lhAF --color --group-directories-first'

alias du="du -h"
alias df="df -h"

alias ap="ALL_PROXY=http://$HTTP"
alias eap="export ALL_PROXY=http://$HTTP"
alias uap="export ALL_PROXY="

# App
# -----------------------
alias asr='alias | rg'
alias rg='rg --ignore-file=~/.gitignore --ignore-file=~/.config/.rgignore'
alias rt='trash'
alias rr="ranger"
alias vi='nvim'
alias lg='lazygit'
alias pc="proxychains4"
alias h="htop"

# Remove .DS_Store files recursively in a directory, default .
function rmdsstore() {
  find "${@:-.}" -type f -name .DS_Store -delete
}

#######################################
# zsh_stats
# Arguments:
#   Number: top most used command
# Outputs:
#   Lists of commands stats
#######################################

function zsh_stats {
  fc -l 1 \
    | perl -lane '
$h{$F[1]}++;$count++;END
{foreach (keys %h) {printf "%s %.2f%% %d\n", $_, ($h{$_}*100/$count), $h{$_};}}' \
    | grep -v "./" \
    | sort -nr -k 3 \
    | head -n ${1:-30} \
    | perl -lane 'printf "%s %s\n", $_ , "▄" x ($F[2] / 5)' \
    | column -s " " -t \
    | perl -pe '$_=" ".$_'
}

#  ---------------------------- Git --------------------------------

alias gc='git commit'
alias gcm='git commit -m '
alias gcd='git commit --amend'
alias gcdn='git commit --amend --no-edit'

alias ge='git restore'

alias gst='git stash'
alias gsts='git stash show --stat -p'

## Branch
alias gb='git branch'
alias gbd='git branch -d'
alias gbu='git branch -u'
alias gba='git branch -vv -a'

alias gw='git switch'
alias gwc='git switch -c'

alias gm='git merge'
alias gmt='git mergetool'

alias gp='git push'
alias gpa='git push --all'
alias gpt='git push --tags'
alias gpp='git push --prune'
alias gpd='git push --delete'
alias gpu='git push --set-upstream'

alias gcl='git clone'
alias gclr='git clone --recurse-submodules'

alias gpl='git pull'
alias gplr='git pull --rebase --autostash -v'

# submodule
alias gsm='git submodule'
alias gsmf='git submodule foreach'

alias gs='git status -sb'
alias gbl='git blame -w --abbrev=6'
alias gslog='git shortlog -nc'

alias gl='git log --graph'
alias glt='git log --graph --stat'
alias gla='git log --graph --all'
alias glta='git log --graph --all --stat'

## Diff
alias gd='git diff'
alias gdc='git diff --cached'
alias gds='git diff --stat'
alias gdcs='git diff --stat --cached'
alias gdt='git difftool'

## Debug

## Worktree & Index
alias gclean='git clean -id'
alias grm='git rm -r -f'
alias grmc='git rm -r --cached'

alias gcp='git cherry-pick'
alias grv='git revert'
alias grvv='git revert HEAD'
alias grvn='git revert --no-commit'

grename() {
  if [[ -z "$1" || -z "$2" ]]; then
    echo "Usage: $0 old_branch new_branch"
    return 1
  fi

  # Rename branch locally
  git branch -m "$1" "$2"
  # Rename branch in origin remote
  if git push origin :"$1"; then
    git push --set-upstream origin "$2"
  fi
}

grebuild() {
  for BR in $(
    git branch --format="%(refname:lstrip=2)"
  ); do
    git checkout "$BR"
    git checkout --orphan "${BR}_temp"
    git add -A
    git commit -m "Initial commit"
    git branch -D "$BR"
    git branch -m "$BR"
  done
  git gc --aggressive --prune=all
  # git push -f --all
}

gsma() {
  if [[ "$#" -eq 1 ]]; then
    git submodule add --depth 10 --force -- $1
  elif [[ "$#" -eq 2 ]]; then
    git submodule add --depth 10 --force --name $(basename $2) -- $1 $2
  else
    echo "wrong arguments !"
  fi
}

gpr-start() {
  gh repo fork --remote --remote-name ${1:-upstream}
}

gpr-end() {
  git fetch origin
  gh delete-repo $(git remote get-url ${1:-upstream} \
    | sed -n 's/.*github.com\/\(.*\)\.git/\1/p')
  git checkout origin/HEAD && git remote remove ${1:-upstream}
}

outcp() {
  # setopt local_options local_traps
  # unsetopt print_exit_value
  trap 'echo "\nOutput copied!"' INT
  tee <<(eval "$@") >(pbcopy) 2>/dev/null && echo "\nOutput copied!"
}
