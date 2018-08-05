# 前提系
## clipboard関連
brew cask install xquartz
brew install xclip
## migemo
brew install cmigemo

##################################################
##### コマンド関連 #####
brew install coreutils
brew install wget
brew install nkf
brew install ssh-copy-id
brew install jq
brew install tig
brew install colordiff
brew install pandoc
brew install pstree

brew install rmtrash

curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh

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

# go
brew install go
go get -u fmt
go get -u github.com/motemen/gore
go get -u github.com/nsf/gocode
go get -u github.com/k0kubun/pp
go get -u golang.org/x/tools/cmd/godoc
go get -u golang.org/x/tools/cmd/goimports

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


