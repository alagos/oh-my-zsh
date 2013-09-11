# ------------------------------------------------------------------------
# alagos
# oh-my-zsh theme
# mix of junkfood and juanghurtado
# ------------------------------------------------------------------------

# Color shortcuts
RED=$fg[red]
YELLOW=$fg[yellow]
GREEN=$fg[green]
WHITE=$fg[white]
BLUE=$fg[blue]
RED_BOLD=$fg_bold[red]
YELLOW_BOLD=$fg_bold[yellow]
GREEN_BOLD=$fg_bold[green]
WHITE_BOLD=$fg_bold[white]
BLUE_BOLD=$fg_bold[blue]
CYAN_BOLD=$fg_bold[cyan]

# Grab the current date (%W) and time (%t):
JUNKFOOD_TIME_="%{$WHITE_BOLD%}( %{$YELLOW_BOLD%}%W%{$reset_color%}@%{$WHITE_BOLD%}%t )( %{$reset_color%}"

# Grab the current username 
JUNKFOOD_CURRENT_USER_="%{$GREEN_BOLD%}%n%{$reset_color%}"

# Grab the current machine name 
JUNKFOOD_MACHINE_="%{$BLUE_BOLD%}%m%{$WHITE_BOLD%} )%{$reset_color%}"

JUNKFOOD_GIT_="\$(git_prompt_info)%{$reset_color%}"

# Grab the current filepath, use shortcuts: ~/Desktop
# Append the current git branch, if in a git repository: ~aw@master
JUNKFOOD_LOCA_="%{$CYAN_BOLD%}%~ %{$RED_BOLD%}➜%{$reset_color%}"

# For the git prompt, use a white @ and blue text for the branch name
ZSH_THEME_GIT_PROMPT_PREFIX="%{$WHITE_BOLD%}@%{$WHITE_BOLD%}"

# Close it all off by resetting the color and styles.
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

# Do nothing if the branch is clean (no changes).
ZSH_THEME_GIT_PROMPT_CLEAN="%{$GREEN_BOLD%}✔"

# Add 3 cyan ✗s if this branch is diiirrrty! Dirty branch!
ZSH_THEME_GIT_PROMPT_DIRTY="%{$RED_BOLD%}✗"

# Format for git_prompt_status()
ZSH_THEME_GIT_PROMPT_UNMERGED=" %{$RED%}unmerged"
ZSH_THEME_GIT_PROMPT_DELETED=" %{$RED%}deleted"
ZSH_THEME_GIT_PROMPT_RENAMED=" %{$YELLOW%}renamed"
ZSH_THEME_GIT_PROMPT_MODIFIED=" %{$YELLOW%}modified"
ZSH_THEME_GIT_PROMPT_ADDED=" %{$GREEN%}added"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$WHITE%}untracked"

# Format for git_prompt_ahead()
ZSH_THEME_GIT_PROMPT_AHEAD=" %{$RED%}(!)"

# Format for git_prompt_long_sha() and git_prompt_short_sha()
ZSH_THEME_GIT_PROMPT_SHA_BEFORE=" %{$WHITE%}[%{$YELLOW%}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$WHITE%}]"

# Put it all together!
PROMPT="$JUNKFOOD_TIME_$JUNKFOOD_CURRENT_USER_@$JUNKFOOD_MACHINE_$JUNKFOOD_GIT_
 $JUNKFOOD_LOCA_ "

RPROMPT='%{$GREEN_BOLD%}$(git_prompt_short_sha)$(git_prompt_status)%{$reset_color%}'
