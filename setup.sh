DOTFILES_DIR=${funcsourcetrace[1]%/*};

##
# Install and setup homebrew
##
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)";
brew bundle --file $DOTFILES_DIR/Brewfile;

echo "============================================";

##
# Configure Git
##
git config --global user.name "Matt Cooper";
git config --global user.email me@matt.coop;
git config --global push.default current;
git config --global core.excludesfile $DOTFILES_DIR/gitignore_global;
git config --global core.pager more

echo "============================================";

##
# Setup SSH key and add to github
##
echo "Setting up SSH key"
if [[ -f "~/.ssh/id_rsa" ]]; then
	echo "~/.ssh/id_rsa already exists. Using pre-existing key.";
else
	ssh-keygen -t rsa -b 4096 -C "me@matt.coop";
fi
if [[ -f "~/.ssh/config" ]]; then
	# Config file exists, so don't add anything manually for safety.
	echo "~/.ssh/config already exists, so not adding Host *. See the following link for instructions on manually adding it:";
	echo "https://help.github.com/en/enterprise/2.15/user/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent.";
else
	# Add id_rsa to the config
	touch ~/.ssh/config;
	echo "Host *" >> ~/.ssh/config;
	echo "\tAddKeysToAgent yes" >> ~/.ssh/config;
	echo "\tUseKeychain yest" >> ~/.ssh/config;
	echo "\tIdentityFile ~/.ssh/id_rsa" >> ~/.ssh/config;
fi
eval "$(ssh-agent -s)";
ssh-add -K ~/.ssh/id_rsa;
pbcopy < ~/.ssh/id_rsa.pub;
echo "id_rsa.pub copied to clipboard. Add it to https://github.com with the following instructions:";
echo "https://help.github.com/en/enterprise/2.15/user/articles/adding-a-new-ssh-key-to-your-github-account";

echo "============================================";

##
# Install oh-my-zsh
##
echo "Installing oh-my-zsh";
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)";
mv ~/.zshrc ~/.zshrc.bak.setup.$(date +'%Y-%m-%d');  # Make a backup in case there was anything important
touch ~/.zshrc;
echo "source $DOTFILES_DIR/zshrc" >> ~/.zshrc;

echo "Installing powerline fonts";
git clone https://github.com/powerline/fonts.git --depth=1 powerline-fonts;
./powerline-fonts/install.sh;
rm -rf powerline-fonts;

echo "Installing plugins";
source ~/.zshrc;
git clone "https://github.com/MichaelAquilina/zsh-autoswitch-virtualenv.git" "$ZSH_CUSTOM/plugins/autoswitch_virtualenv";

echo "============================================";

echo 'Setting up python';
sudo easy_install pip;
pip install virtualenv;
pip3 install virtualenv;

echo "============================================";

echo 'Misc. setup';
echo 'Authenticating ngrok';
ngrok authtoken 1aufEw4ziI1aBym1va4N0x7w8fK_7GHX5RvzebCr7yGSjCF2k

source ~/.zshrc;

