# 前提系
## clipboard関連
brew cask install xquartz
brew install xclip
## migemo
brew install cmigemo

##################################################
##### コマンド関連 #####
brew install wget
brew install nkf
brew install ssh-copy-id
brew install jq
brew install tig

curl -L https://raw.githubusercontent.com/dankogai/osx-mv2trash/master/bin/mv2trash > ~/bin/mv2trash

##################################################
##### 開発系 #####
# neovim (xquartz, xclip, cmigemo前提)
brew install neovim/neovim/neovim
mkdir -p ~/.config/nvim/
ln -sf ~/.vimrc ~/.config/nvim/init.vim
# dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
mkdir -p ~/.vim/dein
sh ./installer.sh ~/.vim/dein

# 開発
brew cask install iterm2
brew cask install virtualbox
brew cask install vagrant

# キーボード関連
brew cask install cmd-eikana
# ウィンドウ関連
brew cask install shiftit

##################################################
##### 言語系 #####
brew cask install java
brew install scala
brew install sbt

# python
curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash

# node
curl -L git.io/nodebrew | perl - setup

sudo gem install sass


##################################################
##### 色々 #####
brew cask install google-chrome
brew cask install gimp
brew cask install slack
brew cask install dropbox
brew cask install evernote

# ブルーライト
brew cask install flux

# ⌘キー長押しでチートシート表示
brew cask install cheatsheet


