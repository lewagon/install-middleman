#!/usr/bin/env bash

set -e

echo "Step 1/5 - Installing Homebrew"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" || true
brew install git

echo "Step 2/5 - Installing oh-my-zsh"
uninstall_oh_my_zsh || true
curl -L https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash

zsh

echo "Step 3/5 - Installing rbenv"
echo 'export RBENV_ROOT="${HOME}/.rbenv"' >> ${HOME}/.zshrc
echo 'export PATH="${RBENV_ROOT}/bin:${PATH}"'  >> ${HOME}/.zshrc
echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi'  >> ${HOME}/.zshrc
echo 'export LANG=en_US.UTF-8'  >> ${HOME}/.zshrc
echo 'export LC_ALL=en_US.UTF-8'   >> ${HOME}/.zshrc
source ${HOME}/.zshrc

curl https://raw.githubusercontent.com/fesplugas/rbenv-installer/master/bin/rbenv-installer | bash

echo "Step 4/5 - Installing Ruby 2.2.0"
rbenv install 2.2.0
rbenv global 2.2.0

echo "Step 5/5 - Installing Middleman"
gem install bundler middleman
