#!/usr/bin/env zsh

# Aliases
# default
# -----------------------
alias zr='source ~/.zshrc'
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
# alias ssha='ssh root@157.245.125.95'

# App
# -----------------------
alias asr='alias | rg'
alias rt='trash'
alias rr="ranger"
alias vi='nvim'
alias lg='lazygit'
alias pc="proxychains4"

#  ---------------------------- Git --------------------------------

# The name of the current branch
# Back-compatibility wrapper for when this function was defined here in
# the plugin, before being pulled in to core lib/git.zsh as git_current_branch()
# to fix the core -> git plugin dependency.
function current_branch() {
  git_current_branch
}

# Warn if the current branch is a WIP
function work_in_progress() {
  if $(git log -n 1 2>/dev/null | grep -q -c "\-\-wip\-\-"); then
    echo "WIP!!"
  fi
}

# Check if main exists and use instead of master
function git_main_branch() {
  command git rev-parse --git-dir &>/dev/null || return
  local ref
  for ref in refs/{heads,remotes/{origin,upstream}}/{main,trunk}; do
    if command git show-ref -q --verify $ref; then
      echo ${ref:t}
      return
    fi
  done
  echo master
}

# Check for develop and similarly named branches
function git_develop_branch() {
  command git rev-parse --git-dir &>/dev/null || return
  local branch
  for branch in dev devel development; do
    if command git show-ref -q --verify refs/heads/$branch; then
      echo $branch
      return
    fi
  done
  echo develop
}

function grename() {
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

alias ga='git add'
alias gai='git add --interactive'
alias gaa='git add --all'
alias gae='git add --edit'
alias gau='git add --update'
alias gap='git add --patch'

alias gc='git commit'
alias gcm='git commit -m '
alias gcam='git commit -am '
alias gcd='git commit --amend'
alias gcdn='git commit --amend --no-edit'

alias ge='git restore'

alias gst='git stash'
alias gsts='git stash show --stat -p'

## Branch
alias gb='git branch'
alias gbd='git branch -d'
alias gbu='git branch -u origin/$(git_current_branch)'
alias gbv='git branch --list -vv -a'
alias gbm='git branch -vv --merged'

alias gw='git switch'
alias gwm='git switch $(git_main_branch)'
alias gwd='git switch develop'
alias gwc='git switch -c'
alias gwt='git switch --track'

alias gm='git merge'
alias gmt='git mergetool'
alias gmd='git merge develop'
alias gmo='git merge origin/master'
alias gmu='git merge upstream/master'

alias grb='git rebase'
alias grbi='git rebase -i'
alias grbd='git rebase develop'
alias grbm='git rebase $(git_main_branch)'

alias gp='git push'
alias gpo='git push origin "$(git_current_branch)"'
alias gpa='git push --all origin'
alias gpt='git push --tags origin'
alias gpp='git push --prune origin'
alias gpd='git push --delete'
alias gpu='git push --set-upstream origin $(git_current_branch)'

alias gf='git fetch'
alias gfo='git fetch origin'
alias gfu='git fetch upstream'
alias gfa='git fetch --all'

alias gcl='git clone'
alias gclr='git clone --recurse-submodules'

alias gr='git remote'
alias gra='git remote add'
alias grr='git remote remove'

alias gpl='git pull'
alias gplu='git pull upstream $(git_current_branch)'
alias gplo='git pull origin "$(git_current_branch)"'
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
alias gdd='git diff $(git_main_branch)...HEAD'
alias gdt='git difftool'

## Debug
alias gbs='git bisect'
alias gbss='git bisect start'
alias gbsb='git bisect bad'
alias gbsg='git bisect good'
alias gbsk='git bisect skip'
alias gbsr='git bisect run'
alias gbsl='git bisect log'
alias gbsr='git bisect reset'

## Worktree & Index
alias gclean='git clean -id'
alias grm='git rm -r -f'
alias grmc='git rm -r --cached'

alias gcp='git cherry-pick'
alias grv='git revert'
alias grvv='git revert HEAD'
alias grvn='git revert --no-commit'

alias grt='git reset'
alias grth='git reset --hard'
alias grts='git reset --soft'

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

gpr-start() {
  gh repo fork --remote --remote-name ${1:-upstream}
}

gpr-end() {
  git fetch origin
  gh delete-repo $(git remote get-url ${1:-upstream} \
    | sed -n 's/.*github.com\/\(.*\)\.git/\1/p')
  git checkout origin/HEAD && git remote remove ${1:-upstream}
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

gef() {
  local inst
  inst=$(git ls-files -m --exclude-standard \
    | fzf "${fzf_opts[@]}" --header='[git restore:]')

  if [ -n "$inst" ]; then
    for f in $(echo "$inst"); do
      git restore "$f"
    done
  fi
}

# SEE https://www.javaer101.com/en/article/16751334.html
ges() {
  local inst
  inst=$(git diff --name-only --cached \
    | xargs -I '{}' realpath --relative-to=. "$(git rev-parse --show-toplevel)"/'{}' \
    | fzf "${fzf_opts[@]}" --header='[git restore: --staged]')

  if [ -n "$inst" ]; then
    for f in $(echo "$inst"); do
      git restore --staged "$f"
    done
  fi
}

gea() {
  local inst
  inst=$(git diff --name-only HEAD \
    | xargs -I '{}' realpath --relative-to=. "$(git rev-parse --show-toplevel)"/'{}' \
    | fzf "${fzf_opts[@]}" --header='[git restore: --staged --worktree]')

  if [ -n "$inst" ]; then
    for f in $(echo "$inst"); do
      git restore --staged --worktree "$f"
    done
  fi
}
