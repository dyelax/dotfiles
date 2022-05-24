DOTFILES_DIR=${funcsourcetrace[1]%/*}

source $DOTFILES_DIR/machine_specific  # Make sure to export $ZSH with the path to your oh-my-zsh installation in here.
source $DOTFILES_DIR/oh-my-zsh_setup
source $DOTFILES_DIR/git_aliases
source $DOTFILES_DIR/tmux_aliases
source $DOTFILES_DIR/misc_aliases
source $DOTFILES_DIR/rn_android_setup
source $DOTFILES_DIR/studio

