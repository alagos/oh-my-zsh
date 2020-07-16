# You can put files here to add functionality separated per file, which
# will be ignored by git.
# Files on the custom/ directory will be automatically loaded by the init
# script, in alphabetical order.

# For example: add yourself some shortcuts to projects you often work on.
#
# brainstormr=~/Projects/development/planetargon/brainstormr
# cd $brainstormr
#
alias vw="cd ~/workspace/vwork"
alias vww="cd ~/workspace/vwork/vworkapp/webapp"
alias vwr="cd ~/workspace/vwork/vworkapp/reactive"
alias vwrt="cd ~/workspace/vwork/regression-tests"
alias dc='docker-compose -f ~/workspace/vwork/vworkapp/docker-compose.yml -f ~/workspace/vwork/vworkapp/docker-compose.dev.yml'

alias cpr="rsync --archive --human-readable --verbose --progress --whole-file"
alias wttr="curl wttr.in/akl?format=v2"
