#!/bin/sh
echo "---------------------------------------------------------"
echo "$(tput setaf 2)JOHN: Greetings. Preparing to power up and begin diagnostics.$(tput sgr 0)"
echo "---------------------------------------------------------"

# TODO
# Install python2
# Install node
# zsh setup: https://www.freecodecamp.org/news/coding-like-a-hacker-in-the-terminal-79e22954968e/

echo "---------------------------------------------------------"
echo "$(tput setaf 2)JOHN: Installing system packages.$(tput sgr 0)"
echo "---------------------------------------------------------"
packages=(
  "git"
  "tmux"
  "neovim"
  "python3"
  "zsh"
  "ripgrep"
  "fzf"
  "httpie"
  "npm"
)

for i in "${packages[@]}"
do
  sudo apt-get install $i
  echo "---------------------------------------------------------"
done

echo "---------------------------------------------------------"
echo "$(tput setaf 2)JOHN: Installing haxor-news.$(tput sgr 0)"
echo "---------------------------------------------------------"
sudo pip3 install haxor-news

echo "---------------------------------------------------------"
echo "$(tput setaf 2)JOHN: Installing ruby and rbenv.$(tput sgr 0)"
echo "---------------------------------------------------------"
sudo apt update
sudo apt install gcc make libssl-dev libreadline-dev zlib1g-dev libsqlite3-dev
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(rbenv init -)"' >> ~/.zshrc
exit
mkdir -p "$(rbenv root)"/plugins
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
rbenv -v

rbenv install 2.7.0 --verbose
rbenv global 2.7.0
ruby -v


echo "---------------------------------------------------------"
echo "$(tput setaf 2)JOHN: Installing system fonts.$(tput sgr 0)"
echo "---------------------------------------------------------"
sudo apt-get install fonts-powerline

echo "---------------------------------------------------------"
echo "$(tput setaf 2)JOHN: Installing Python NeoVim client.$(tput sgr 0)"
echo "---------------------------------------------------------"

pip3 install neovim

echo "---------------------------------------------------------"
echo "$(tput setaf 2)JOHN: Installing node neovim package$(tput sgr 0)"
echo "---------------------------------------------------------"

npm install -g neovim

echo "---------------------------------------------------------"
echo "$(tput setaf 2)JOHN: Installing spaceship prompt$(tput sgr 0)"
echo "---------------------------------------------------------"

npm install -g spaceship-prompt

git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1

ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme" 

" set ZSH_THEME=spaceship in zshrc


echo "---------------------------------------------------------"
echo "$(tput setaf 2)JOHN: Installing vim linter (vint)$(tput sgr 0)"
echo "---------------------------------------------------------"

pip3 install vim-vint

echo "---------------------------------------------------------"
echo "$(tput setaf 2)JOHN: Installing colorls$(tput sgr 0)"
echo "---------------------------------------------------------"

gem install colorls

echo "---------------------------------------------------------"
echo "$(tput setaf 2)JOHN: Installing oh-my-zsh.$(tput sgr 0)"
echo "---------------------------------------------------------"

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
  echo "---------------------------------------------------------"
  echo "$(tput setaf 2)JOHN: oh-my-zsh already installed.$(tput sgr 0)"
  echo "---------------------------------------------------------"
fi

echo "---------------------------------------------------------"
echo "$(tput setaf 2)JOHN: Installing vtop.$(tput sgr 0)"
echo "---------------------------------------------------------"
npm install -g vtop

echo "---------------------------------------------------------"
echo "$(tput setaf 2)JOHN: Installing tmux plugin manager.$(tput sgr 0)"
echo "---------------------------------------------------------"

if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  ~/.tmux/plugins/tpm/scripts/install_plugins.sh
fi

echo "---------------------------------------------------------"
echo "$(tput setaf 2)JOHN: Switching shell to zsh. You may need to logout.$(tput sgr 0)"
echo "---------------------------------------------------------"

sudo sh -c "echo $(which zsh) >> /etc/shells"
chsh -s $(which zsh)

echo "---------------------------------------------------------"
echo "$(tput setaf 2)JOHN: Installing nvm .$(tput sgr 0)"
echo "---------------------------------------------------------"

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash


echo "---------------------------------------------------------"
echo "$(tput setaf 2)JARVIS: System update complete. Currently running at 100% power. Enjoy.$(tput sgr 0)"
echo "---------------------------------------------------------"

exit 0

