# Query/use custom command for `git`.
zstyle -s ":vcs_info:git:*:-all-" "command" _omz_git_git_cmd
: ${_omz_git_git_cmd:=git}

#
# Functions
#

# The name of the current branch
# Back-compatibility wrapper for when this function was defined here in
# the plugin, before being pulled in to core lib/git.zsh as git_current_branch()
# to fix the core -> git plugin dependency.
function current_branch() {
  git_current_branch
}
# The list of remotes
function current_repository() {
  if ! $_omz_git_git_cmd rev-parse --is-inside-work-tree &> /dev/null; then
    return
  fi
  echo $($_omz_git_git_cmd remote -v | cut -d':' -f 2)
}
# Pretty log messages
function _git_log_prettily(){
  if ! [ -z $1 ]; then
    git log --pretty=$1
  fi
}
# Warn if the current branch is a WIP
function work_in_progress() {
  if $(git log -n 1 2>/dev/null | grep -q -c "\-\-wip\-\-"); then
    echo "WIP!!"
  fi
}

#
# Aliases
# (sorted alphabetically)
#

alias g='git'
compdef g=git
alias gsw='git show'
compdef _git gsw=git-show
alias gst='git status'
compdef _git gst=git-status
alias gss='git status -s'
compdef _git gss=git-status
alias gsti='git status --ignored'
compdef _git gsti=git-status
alias gd='git diff'
compdef _git gd=git-diff
alias gdm='git diff --diff-filter=M'
compdef _git gdm=git-diff
alias gds='git diff --stat' #Show changes statistics
compdef _git gds=git-diff
alias gpu='git pull'
compdef _git gpu=git-pull
alias gpuo='git pull origin'
compdef _git gpuo=git-pull
alias gpuom='git pull origin master'
compdef _git gpuom=git-pull
alias gpuod='git pull origin develop'
compdef _git gpuod=git-pull
alias gdc='git diff --cached'
compdef _git gdc=git-diff
alias gl='git log'
compdef _git gl=git-log
alias gdt='git diff-tree --no-commit-id --name-only -r'
compdef _git gdc=git diff-tree --no-commit-id --name-only -r
alias gup='git pull --rebase'
compdef _git gup=git-fetch
alias gp='git push'
compdef _git gp=git-push
alias gpo='git push origin'
compdef _git gpo=git-push
alias gpom='git push origin master'
compdef _git gpom=git-push
alias gphm='git push heroku master'
compdef _git gpom=git-push
gdv() { git diff -w "$@" | view - }
compdef _git gdv=git-diff
alias gdt='git difftool'
# alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gcn!='git commit -v --no-edit --amend'
alias gca='git commit -v -a'
compdef _git gca=git-commit
alias gca!='git commit -v -a --amend'
alias gcan!='git commit -v -a --no-edit --amend'
alias gcans!='git commit -v -a -s --no-edit --amend'
alias gcam='git commit -a -m'
alias gcb='git checkout -b'
alias gcf='git config --list'
alias gcl='git clone --recursive'
alias gclean='git clean -fd'
alias gpristine='git reset --hard && git clean -dfx'
alias gcm='git checkout master'
alias gcmsg='git commit -m'
alias gco='git checkout'
compdef _git gco=git-checkout
alias gcom='git checkout master'
compdef _git gcom=git-checkout
alias gcod='git checkout develop'
compdef _git gcod=git-checkout
alias gr='git remote'
compdef _git gr=git-remote
alias grv='git remote -v'
compdef _git grv=git-remote
alias grmv='git remote rename'
compdef _git grmv=git-remote
alias grrm='git remote remove'
compdef _git grrm=git-remote
alias grset='git remote set-url'
compdef _git grset=git-remote
alias grup='git remote update'
compdef _git grup=git-remote
alias grbi='git rebase -i'
compdef _git grbi=git-rebase
alias grbc='git rebase --continue'
compdef _git grbc=git-rebase
alias grba='git rebase --abort'
compdef _git grba=git-rebase
alias gb='git branch'
compdef _git gb=git-branch
alias gba='git branch -a'
compdef _git gba=git-branch
alias gbr='git branch --remote'
alias gcount='git shortlog -sn'
compdef _git gcount=git-shortlog
alias gcl='git config --list'
alias gcp='git cherry-pick'
compdef _git gcp=git-cherry-pick
alias glg='git log --stat --max-count=10'
compdef _git glg=git-log
alias glgg='git log --graph --max-count=10'
compdef _git glgg=git-log
alias glgga='git log --graph --decorate --all'
compdef _git glgga=git-log
alias glggao='git log --graph --decorate --all --oneline'
compdef _git glggao=git-log
alias glo='git log --oneline --decorate --color'
compdef _git glo=git-log
alias glog='git log --oneline --decorate --color --graph'
compdef _git glog=git-log
alias gss='git status -s'
compdef _git gss=git-status
function ga() { git add "$@"; git status; }
function gc() { git commit "$@" ; git status; }
function gcm() { git commit -m "$@" ; git status; }
function gcam() { git commit -a -m "$@" ; git status; }
compdef _git ga=git-add
alias gap='git add --patch'
alias gaa='git add --all'
alias gm='git merge'
compdef _git gm=git-merge
alias gmm='git merge master'
compdef _git gmm=git-merge
alias grh='git reset HEAD'
compdef _git grh=git-reset
alias grhh='git reset HEAD --hard'
compdef _git grhh=git-reset
alias gclean='git reset --hard && git clean -dfx'
alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'

# Sign and verify commits with GPG
alias gcs='git commit -S'

alias gcount='git shortlog -sn'
compdef gcount=git
alias gcp='git cherry-pick'

alias gd='git diff'
alias gdca='git diff --cached'
alias gdct='git describe --tags `git rev-list --tags --max-count=1`'
alias gdt='git diff-tree --no-commit-id --name-only -r'
alias gdw='git diff --word-diff'

gdv() { git diff -w "$@" | view - }
compdef _git gdv=git-diff

alias gf='git fetch'
alias gfa='git fetch --all --prune'
alias gfo='git fetch origin'

function gfg() { git ls-files | grep $@ }
compdef _grep gfg

alias gg='git gui citool'
alias gga='git gui citool --amend'

ggf() {
  [[ "$#" != 1 ]] && local b="$(git_current_branch)"
  git push --force origin "${b:=$1}"
}
compdef _git ggf=git-checkout

alias gcln='git clean -nd' # Test removal of untracked files and directories
alias gclf='git clean -fd' # Remove untracked files and directories

# Stashing aliases
alias gsh='git stash'
alias gsha='git stash apply'
alias gshc='git stash clear'
alias gshl='git stash list'
alias gshp='git stash pop'
compdef _git gsh=git-stash
compdef _git gsha=git-stash
compdef _git gshc=git-stash
compdef _git gshl=git-stash
compdef _git gshp=git-stash

# Will stage all files marked as 'deleted'
alias grma="git diff --diff-filter=D --name-only -z | xargs -0 git rm"

# Will cd into the top of the current repository
# or submodule.
alias grt='cd $(git rev-parse --show-toplevel || echo ".")'

ggl() {
  if [[ "$#" != 0 ]] && [[ "$#" != 1 ]]; then
    git pull origin "${*}"
  else
    [[ "$#" == 0 ]] && local b="$(git_current_branch)"
    git pull origin "${b:=$1}"
  fi
}
compdef _git ggl=git-checkout

ggp() {
  if [[ "$#" != 0 ]] && [[ "$#" != 1 ]]; then
    git push origin "${*}"
  else
    [[ "$#" == 0 ]] && local b="$(git_current_branch)"
    git push origin "${b:=$1}"
  fi
}
compdef _git ggp=git-checkout

ggpnp() {
  if [[ "$#" == 0 ]]; then
    ggl && ggp
  else
    ggl "${*}" && ggp "${*}"
  fi
}
compdef _git ggpnp=git-checkout

ggu() {
  [[ "$#" != 1 ]] && local b="$(git_current_branch)"
  git pull --rebase origin "${b:=$1}"
}
compdef _git ggu=git-checkout

alias ggpur='ggu'
compdef _git ggpur=git-checkout

alias ggpull='git pull origin $(git_current_branch)'
compdef _git ggpull=git-checkout

alias ggpush='git push origin $(git_current_branch)'
compdef _git ggpush=git-checkout

alias ggsup='git branch --set-upstream-to=origin/$(git_current_branch)'

alias gpsup='git push --set-upstream origin $(git_current_branch)'

alias gignore='git update-index --assume-unchanged'
alias gignored='git ls-files -v | grep "^[[:lower:]]"'
alias git-svn-dcommit-push='git svn dcommit && git push github master:svntrunk'
compdef git-svn-dcommit-push=git

alias gk='\gitk --all --branches'
compdef _git gk='gitk'
alias gke='\gitk --all $(git log -g --pretty=format:%h)'
compdef _git gke='gitk'

alias gl='git pull'
alias glg='git log --stat'
alias glgp='git log --stat -p'
alias glgg='git log --graph'
alias glgga='git log --graph --decorate --all'
alias glgm='git log --graph --max-count=10'
alias glo='git log --oneline --decorate'
alias glol="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glola="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --all"
alias glog='git log --oneline --decorate --graph'
alias gloga='git log --oneline --decorate --graph --all'
alias glp="_git_log_prettily"
compdef _git glp=git-log

# Make a rm to all files marked as 'deleted'
alias grd="git diff --diff-filter=D --name-only -z | xargs -0 git rm ; git status"

# aliases for git flow
alias gff='git flow feature'
alias gfh='git flow hotfix'
alias gfr='git flow release'
# Work In Progress (wip)
# These features allow to pause a branch development and switch to another one (wip)
# When you want to go back to work, just unwip it
#
# This function return a warning if the current branch is a wip
function work_in_progress() {
  if $(git log -n 1 2>/dev/null | grep -q -c "\-\-wip\-\-"); then
    echo "WIP!!"
  fi
}
# these alias commit and uncomit wip branches
alias gwip='git add -A; git ls-files --deleted -z | xargs -r0 git rm; git commit -m "--wip--"'
alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'

alias gunignore='git update-index --no-assume-unchanged'
# list temporarily ignored files
alias gignored='git ls-files -v | grep "^[[:lower:]]"'

alias git-sort-branches="git for-each-ref --sort=-committerdate refs/heads/ --format='%(committerdate:short) %(authorname) %(refname:short)'"
alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'
alias gup='git pull --rebase'
alias gupv='git pull --rebase -v'
alias glum='git pull upstream master'

alias gwch='git whatchanged -p --abbrev-commit --pretty=medium'
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit -m "--wip--"'
