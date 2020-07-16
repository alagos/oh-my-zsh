function _rails_command () {
  if [ -e "bin/stubs/rails" ]; then
    bin/stubs/rails $@
  elif [ -e "bin/rails" ]; then
    bin/rails $@
  elif [ -e "script/rails" ]; then
    ruby script/rails $@
  elif [ -e "script/server" ]; then
    ruby script/$@
  else
    command rails $@
  fi
}

function _rake_command () {
  if [ -e "bin/stubs/rake" ]; then
    bin/stubs/rake $@
  elif [ -e "bin/rake" ]; then
    bin/rake $@
  elif type bundle &> /dev/null && [ -e "Gemfile" ]; then
    bundle exec rake $@
  else
    command rake $@
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
alias rc='bundle exec rails console'
alias rcs='bundle exec rails console --sandbox'
alias rd='bundle exec rails destroy'
alias rdb='bundle exec rails dbconsole'
alias rg='bundle exec rails generate'
alias rgm='bundle exec rails generate migration'
alias rp='bundle exec rails plugin'
alias ru='bundle exec rails runner'
alias rs='bundle exec rails server'
alias rsd='bundle exec rails server --debugger'
alias rsp='bundle exec rails server --port'

# Rake aliases
alias rdm='bundle exec rake db:migrate'
alias rdms='bundle exec rake db:migrate:status'
alias rdr='bundle exec rake db:rollback'
alias rdc='bundle exec rake db:create'
alias rds='bundle exec rake db:seed'
alias rdd='bundle exec rake db:drop'
alias rdrs='bundle exec rake db:reset'
alias rdtc='bundle exec rake db:test:clone'
alias rdtp='bundle exec rake db:test:prepare'
alias rdmtc='bundle exec rake db:migrate db:test:clone'
alias rdsl='bundle exec rake db:schema:load'
alias rlc='bundle exec rake log:clear'
alias rn='bundle exec rake notes'
alias rr='bundle exec rake routes'
alias rrg='bundle exec rake routes | grep'
alias rt='bundle exec rake test'
alias rmd='bundle exec rake middleware'
alias rsts='bundle exec rake stats'

# legacy stuff
alias sstat='thin --stats "/thin/stats" start'
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
