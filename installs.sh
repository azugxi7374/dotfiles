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

##################################################
##### 開発系 #####
# neovim (xquartz, xclip, cmigemo前提)
brew install neovim/neovim/neovim
mkdir .config/nvim/
ln -sf ~/.vimrc ~/.config/nvim/init.vim

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

# anyenv
git clone https://github.com/riywo/anyenv ~/.anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"
## anyenv-update
mkdir -p $(anyenv root)/plugins
git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
anyenv update

anyenv install pyenv 
pyenv install anaconda3-4.3.1 && pyenv global anaconda3-4.3.1 && pyenv rehash
brew install pyenv-virtualenv
anyenv install scalaenv
scalaenv install scala-2.12.2 && scalaenv global scala-2.12.2 && scalaenv rehash
anyenv install sbtenv
sbtenv install sbt-0.13.9 && sbtenv global sbt-0.13.9 && sbtenv rehash
anyenv install rbenv 
anyenv install ndenv
ndenv install v7.10.0 && ndenv global v7.10.0　&& ndenv rehash


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


