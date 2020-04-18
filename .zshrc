DOTFILES_DIR=${funcsourcetrace[1]%/*}

source $DOTFILES_DIR/.machine_specific  # Make sure to export $ZSH with the path to your oh-my-zsh installation in here.
source $DOTFILES_DIR/.oh-my-zsh_setup
source $DOTFILES_DIR/.git_aliases
source $DOTFILES_DIR/.tmux_aliases

# Misc. Aliases
alias jnco="jupyter nbconvert --ClearOutputPreprocessor.enabled=True --inplace"
filecount() { cd ${1:-"."} && ls -1 | wc -l && cd -; }
caskadd() { cd $DOTFILES_DIR && echo "cask \"${1}\"" >> Brewfile && gcam "Added cask ${1} to Brewfile" && gp && cd -; }

