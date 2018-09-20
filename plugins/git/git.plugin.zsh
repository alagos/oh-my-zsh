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

#
# Aliases
# (sorted alphabetically)
#
alias g='git'
alias gaa='git add --all'
alias gap='git add --patch'
alias gapa='git add --patch'
alias gau='git add --update'
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gbda='git branch --no-color --merged | command grep -vE "^(\*|\s*(master|develop|dev|testing)\s*$)" | command xargs -n 1 git branch -d'
alias gbl='git blame -b -w'
alias gbnm='git branch --no-merged'
alias gbr='git branch --remote'
alias gbs='git bisect'
alias gbsb='git bisect bad'
alias gbsg='git bisect good'
alias gbsr='git bisect reset'
alias gbss='git bisect start'
alias gc!='git commit -v --amend'
alias gca!='git commit -v -a --amend'
alias gca='git commit -v -a'
alias gcan!='git commit -v -a --no-edit --amend'
alias gcans!='git commit -v -a -s --no-edit --amend'
alias gcb='git checkout -b'
alias gcd='git checkout develop'
alias gcf='git config --list'
alias gcl='git clone --recursive'
alias gclean='git reset --hard && git clean -dfx'
alias gclf='git clean -fd' # Remove untracked files and directories
alias gcln='git clean -nd' # Test removal of untracked files and directories
alias gcmsg='git commit -m'
alias gcn!='git commit -v --no-edit --amend'
alias gco='git checkout'
alias gcod='git checkout develop'
alias gcom='git checkout master'
alias gcount='git shortlog -sn'
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
alias gcs='git commit -S' # Sign and verify commits with GPG
alias gcsm='git commit -s -m'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdca='git diff --cached'
alias gdct='git describe --tags `git rev-list --tags --max-count=1`'
alias gdm='git diff --diff-filter=M'
alias gds='git diff --stat' #Show changes statistics
alias gdt='git difftool'
alias gdw='git diff --word-diff'
alias gf='git fetch'
alias gfa='git fetch --all --prune'
alias gff='git flow feature'
alias gfh='git flow hotfix'
alias gfo='git fetch origin'
alias gfr='git flow release'
alias gg='git gui citool'
alias gga='git gui citool --amend'
alias ggpull='git pull origin $(git_current_branch)'
alias ggpur='ggu'
alias ggpush='git push origin $(git_current_branch)'
alias ggsup='git branch --set-upstream-to=origin/$(git_current_branch)'
alias ghh='git help'
alias gignore='git update-index --assume-unchanged'
alias gignored='git ls-files -v | grep "^[[:lower:]]"' # list temporarily ignored files
alias git-sort-branches="git for-each-ref --sort=-committerdate refs/heads/ --format='%(committerdate:short) %(authorname) %(refname:short)'"
alias git-svn-dcommit-push='git svn dcommit && git push github master:svntrunk'
alias gk='\gitk --all --branches'
alias gke='\gitk --all $(git log -g --pretty=%h)'
alias gl='git log'
alias glm='git log --pretty=format:"%h%x09%aI %s" --author="Alter"'
alias glg='git log --stat --max-count=10'
alias glg='git log --stat'
alias glgg='git log --graph'
alias glgga='git log --graph --decorate --all'
alias glggao='git log --graph --decorate --all --oneline'
alias glgm='git log --graph --max-count=10'
alias glgp='git log --stat -p'
alias glo='git log --oneline --decorate --color'
alias glog='git log --oneline --decorate --color --graph'
alias gloga='git log --oneline --decorate --graph --all'
alias glol="git log --graph --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glola="git log --graph --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --all"
alias glp="_git_log_prettily"
alias glum='git pull upstream master'
alias gm='git merge'
alias gmm='git merge master'
alias gmom='git merge origin/master'
alias gmt='git mergetool --no-prompt'
alias gmtvim='git mergetool --no-prompt --tool=vimdiff'
alias gmum='git merge upstream/master'
alias gp='git push'
alias gpd='git push --dry-run'
alias gphm='git push heroku master'
alias gpo='git push origin'
alias gpoat='git push origin --all && git push origin --tags'
alias gpod='git push origin develop'
alias gpom='git push origin master --tags'
alias gpristine='git reset --hard && git clean -dfx'
alias gpsup='git push --set-upstream origin $(git_current_branch)'
alias gpu='git pull --tags'
alias gpuo='git pull origin'
alias gpuod='git pull origin develop'
alias gpuom='git pull origin master --tags'
alias gpv='git push -v'
alias gr='git remote'
alias gra='git remote add'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbi='git rebase -i'
alias grbm='git rebase master'
alias grbs='git rebase --skip'
alias grd="git diff --diff-filter=D --name-only -z | xargs -0 git rm ; git status" # Make a rm to all files marked as 'deleted'
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'
alias grma="git diff --diff-filter=D --name-only -z | xargs -0 git rm" # Will stage all files marked as 'deleted'
alias grmv='git remote rename'
alias grrm='git remote remove'
alias grset='git remote set-url'
alias grt='cd $(git rev-parse --show-toplevel || echo ".")' # Will cd into the top of the current repository or submodule.
alias gru='git reset --'
alias grup='git remote update'
alias grup='git remote update'
alias grv='git remote -v'
alias gsb='git status -sb'
alias gsd='git svn dcommit'
alias gsh='git stash'
alias gsha='git stash apply'
alias gshc='git stash clear'
alias gshl='git stash list'
alias gshp='git stash pop'
alias gsi='git submodule init'
alias gsps='git show --pretty=short --show-signature'
alias gsr='git svn rebase'
alias gss='git status -s'
alias gst='git status'
alias gsta='git stash save'
alias gstaa='git stash apply'
alias gstc='git stash clear'
alias gstd='git stash drop'
alias gsti='git status --ignored'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash show --text'
alias gsu='git submodule update'
alias gsw='git show'
alias gunignore='git update-index --no-assume-unchanged'
alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1' # this alias uncomit wip branches
alias gup='git pull --rebase'
alias gupv='git pull --rebase -v'
alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'
alias gwch='git whatchanged -p --abbrev-commit --pretty=medium'
alias gwip='git add -A; git ls-files --deleted -z | xargs -r0 git rm; git commit -m "--wip--"' # this alias commit wip branches
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify -m "--wip-- [skip ci]"'
compdef _git ga=git-add
compdef _git gb=git-branch
compdef _git gba=git-branch
compdef _git gca=git-commit
compdef _git gco=git-checkout
compdef _git gcod=git-checkout
compdef _git gcom=git-checkout
compdef _git gcount=git-shortlog
compdef _git gcp=git-cherry-pick
compdef _git gd=git-diff
compdef _git gdc=git-diff
compdef _git gdm=git-diff
compdef _git gds=git-diff
compdef _git gdv=git-diff
compdef _git gdv=git-diff
compdef _git ggf=git-checkout
compdef _git ggl=git-checkout
compdef _git ggp=git-checkout
compdef _git ggpnp=git-checkout
compdef _git ggpull=git-checkout
compdef _git ggpur=git-checkout
compdef _git ggpush=git-checkout
compdef _git ggu=git-checkout
compdef _git git-svn-dcommit-push=git
compdef _git gk='gitk'
compdef _git gke='gitk'
compdef _git gl=git-log
compdef _git glg=git-log
compdef _git glgg=git-log
compdef _git glgga=git-log
compdef _git glggao=git-log
compdef _git glo=git-log
compdef _git glog=git-log
compdef _git glp=git-log
compdef _git gm=git-merge
compdef _git gmm=git-merge
compdef _git gp=git-push
compdef _git gpo=git-push
compdef _git gpoat=git-push
compdef _git gpod=git-pull
compdef _git gpom=git-push
compdef _git gpu=git-pull
compdef _git gpuo=git-pull
compdef _git gpuod=git-pull
compdef _git gpuom=git-pull
compdef _git gr=git-remote
compdef _git grba=git-rebase
compdef _git grbc=git-rebase
compdef _git grbi=git-rebase
compdef _git grh=git-reset
compdef _git grhh=git-reset
compdef _git grmv=git-remote
compdef _git grrm=git-remote
compdef _git grset=git-remote
compdef _git grup=git-remote
compdef _git grv=git-remote
compdef _git gsh=git-stash
compdef _git gsha=git-stash
compdef _git gshc=git-stash
compdef _git gshl=git-stash
compdef _git gshp=git-stash
compdef _git gss=git-status
compdef _git gst=git-status
compdef _git gsti=git-status
compdef _git gsw=git-show
compdef _git gup=git-fetch
compdef _grep gfg
compdef g=git
compdef gcount=git

function ga() { git add "$@"; git status; }
function gc() { git commit "$@" ; git status; }
function gcam() { git commit -a -m "$@" ; git status; }
function gcm() { git commit -m "$@" ; git status; }
function gfg() { git ls-files | grep $@ }

gdv() { git diff -w "$@" | view - }

ggf() {
  [[ "$#" != 1 ]] && local b="$(git_current_branch)"
  git push --force origin "${b:=$1}"
}
ggl() {
  if [[ "$#" != 0 ]] && [[ "$#" != 1 ]]; then
    git pull origin "${*}"
  else
    [[ "$#" == 0 ]] && local b="$(git_current_branch)"
    git pull origin "${b:=$1}"
  fi
}
ggp() {
  if [[ "$#" != 0 ]] && [[ "$#" != 1 ]]; then
    git push origin "${*}"
  else
    [[ "$#" == 0 ]] && local b="$(git_current_branch)"
    git push origin "${b:=$1}"
  fi
}
ggpnp() {
  if [[ "$#" == 0 ]]; then
    ggl && ggp
  else
    ggl "${*}" && ggp "${*}"
  fi
}
ggu() {
  [[ "$#" != 1 ]] && local b="$(git_current_branch)"
  git pull --rebase origin "${b:=$1}"
}

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
