# Changing/making/removing directory
setopt auto_name_dirs
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

alias ..='cd ..'
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'
alias cd/='cd /'

alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

cd () {
  if   [[ "x$*" == "x..." ]]; then
    cd ../..
  elif [[ "x$*" == "x...." ]]; then
    cd ../../..
  elif [[ "x$*" == "x....." ]]; then
    cd ../../../..
  elif [[ "x$*" == "x......" ]]; then
    cd ../../../../..
  elif [ -d ~/.autoenv ]; then
    source ~/.autoenv/activate.sh
    autoenv_cd "$@"
  else
    builtin cd "$@"
  fi
}

alias md='mkdir -p'
alias rd=rmdir
alias d='dirs -v | head -10'

# personal directories
alias 4t='cd ~/4talent/workspace/other_4talent'
alias bci='cd ~/4talent/workspace/bci_solutions/'
alias tao='cd ~/tao/workspace/tao_main'
alias wish='cd ~/workspace/starwish'
alias rabel='cd ~/workspace/rabel'
alias turbius='cd ~/workspace/turbius'
alias hb='cd ~/odesk/martian/hb_upgrade'
alias foc='cd ~/odesk/martian/foc_rebate'
alias cchmc='cd ~/odesk/martian/cchmc'
alias pd='cd ~/odesk/martian/practicaldesk'
alias cls='cd ~/odesk/martian/claim_submit'
alias geoe='cd ~/odesk/martian/geocerts_edge'
alias geoc='cd ~/odesk/martian/geocerts.com'
