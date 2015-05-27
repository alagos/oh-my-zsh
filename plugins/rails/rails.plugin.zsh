function _rails_command () {
  if [ -e "bin/rails" ]; then
    bin/rails $@
  elif [ -e "script/rails" ]; then
    ruby script/rails $@
  elif [ -e "script/server" ]; then
    ruby script/$@
  else
    rails $@
  fi
}

function _rake_command () {
  if [ -e "bin/rake" ]; then
    bin/rake $@
  else
    rake $@
  fi
}

alias rails='_rails_command'
compdef _rails_command=rails

alias rake='_rake_command'
compdef _rake_command=rake

alias devlog='tail -f log/development.log'
alias prodlog='tail -f log/production.log'
alias testlog='tail -f log/test.log'

alias -g RED='RAILS_ENV=development'
alias -g REP='RAILS_ENV=production'
alias -g RET='RAILS_ENV=test'

# Rails aliases
alias rc='bin/rails console'
alias rd='bin/rails destroy'
alias rdb='bin/rails dbconsole'
alias rg='bin/rails generate'
alias rgmi='bin/rails generate migration'
alias rgmo='bin/rails generate model'
alias rg='bin/rails generate'
alias rp='bin/rails plugin'
alias ru='bin/rails runner'
alias rs='bin/rails server'
alias rsd='bin/rails server --debugger'

# Rake aliases
alias rdm='bundle exec bin/rake db:migrate'
alias rdr='bundle exec bin/rake db:rollback'
alias rdc='bundle exec bin/rake db:create'
alias rds='bundle exec bin/rake db:seed'
alias rdd='bundle exec bin/rake db:drop'
alias rdtc='bundle exec bin/rake db:test:clone'
alias rdtp='bundle exec bin/rake db:test:prepare'
alias rdmtc='bundle exec bin/rake db:migrate db:test:clone'

alias rlc='bundle exec bin/rake log:clear'
alias rn='bundle exec bin/rake notes'
alias rr='bundle exec bin/rake routes'

alias rsp='bin/rspec'

# legacy stuff
alias ss='thin --stats "/thin/stats" start'
alias sg='ruby script/generate'
alias sd='ruby script/destroy'
alias sp='ruby script/plugin'
alias sr='ruby script/runner'
alias ssp='ruby script/spec'
alias sc='ruby script/console'
alias sd='ruby script/server --debugger'

function remote_console() {
  /usr/bin/env ssh $1 "( cd $2 && ruby script/console production )"
}
