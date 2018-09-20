# Added `shipit` because `cap` is a reserved word. `cap` completion doesn't work.
# http://zsh.sourceforge.net/Doc/Release/Zsh-Modules.html#The-zsh_002fcap-Module
alias cpd='cap production deploy'
alias cpsr='cap production sidekiq:restart'
alias cpsta='cap production sidekiq:start'
alias cpsto='cap production sidekiq:stop'

func capit() {
  if [ -f Gemfile ]
  then
    bundle exec cap $*
  else
    cap $*
  fi
}
