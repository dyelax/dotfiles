source ~/.machine_specific
bind 'set mark-symlinked-directories on'

export PATH=$PATH:/home/matthcooper/.local/bin

alias gmom="git fetch; git merge origin/master"
alias gdel="git branch -D"
alias gdelrem="git push origin --delete"
grename() { git branch -m $1 $2; git push origin :$1 $2; git push origin -u $2; }
alias gstc="git stash clear"
alias glo="git log"

alias txn="tmux new -s"
alias txa="tmux attach -t"
alias txk="tmux kill-session -t"
alias txl="tmux ls"
alias txls="tmux ls"

alias jnco="jupyter nbconvert --ClearOutputPreprocessor.enabled=True --inplace"

filecount() { cd ${1:-"."} && ls -1 | wc -l && cd -; }

case $- in
  *i*) ;; 
    *) return;;  # Don't run bash-it stuff if we aren't in an interactive shell
esac

# Path to the bash it configuration
export BASH_IT="/home/matthcooper/.bash_it"

# Lock and Load a custom theme file.
# Leave empty to disable theming.
# location /.bash_it/themes/
export BASH_IT_THEME='bobby'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# Set Xterm/screen/Tmux title with only a short username.
# Uncomment this (or set SHORT_USER to something else),
# Will otherwise fall back on $USER.
#export SHORT_USER=${USER:0:8}

# Set Xterm/screen/Tmux title with shortened command and directory.
# Uncomment this to set.
#export SHORT_TERM_LINE=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Uncomment this to make Bash-it create alias reload.
# export BASH_IT_RELOAD_LEGACY=1

# Load Bash It
source "$BASH_IT"/bash_it.sh
