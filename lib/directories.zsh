# Changing/making/removing directory
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

alias -- -='cd -'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

alias md='mkdir -p'
alias rd=rmdir
alias d='dirs -v | head -10'

# List directory contents
alias lsa='ls -lah'
# alias l='ls -lah'
alias l='colorls -lA --sd'
alias ll='ls -lh'
alias la='ls -lAh'

# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

#show instances running for a specific process. Eg: psg chrome
alias psg="ps -fea|grep"

alias xo="xdg-open"

# personal directories
alias 4t='cd ~/workspace/4talent/other_4talent'
alias bci='cd ~/workspace/4talent/bci_solutions/'
alias wish='cd ~/workspace/starwish'
alias rabel='cd ~/workspace/rabel'
alias turc='cd ~/workspace/turbius-core'
alias turs='cd ~/workspace/turbius-static'
alias hb='cd ~/workspace/upwork/martian/hb_upgrade'
alias foc='cd ~/workspace/upwork/martian/foc_rebate'
alias cchmc='cd ~/workspace/upwork/martian/cchmc'
alias pd='cd ~/workspace/upwork/martian/practicaldesk'
alias cls='cd ~/workspace/upwork/martian/claim_submit'
alias geoe='cd ~/workspace/upwork/martian/geocerts_edge'
alias geoc='cd ~/workspace/upwork/martian/geocerts.com'
alias canv='cd ~/workspace/upwork/learning_tapestry/canvas'
alias ry='cd ~/workspace/upwork/learning_tapestry/raiseyou'
alias ryc='cd ~/workspace/upwork/learning_tapestry/core'
alias cf='cd ~/workspace/upwork/etison/clickfunnels'
alias cdy='cd ~/workspace/upwork/atlas/clouddentistry'
alias sba='cd ~/workspace/upwork/atlas/sba2013'
alias mem='cd ~/workspace/members'
alias pw='cd ~/workspace/meloncargo/productswatcher'
alias fapi='cd ~/workspace/meloncargo/facturapi'
alias mbot='cd ~/workspace/meloncargo/melonbot'
alias mapp='cd ~/workspace/upwork/youserve/Main-App'
alias dipro='cd ~/workspace/meloncargo/diprotodon'
alias dazu='cd ~/workspace/meloncargo/dragonfly-azure_data_store'
alias cxp='cd ~/workspace/meloncargo/cx_parser'
alias llc='cd ~/workspace/meloncargo/llaca/'
alias llca='cd ~/workspace/meloncargo/llaca/apps/channel_advisor'
alias mach='cd ~/workspace/machi'
