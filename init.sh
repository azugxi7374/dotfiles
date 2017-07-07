
# homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew tap caskroom/cask

git config --global user.name "ixguza"
git config --global user.email rtk0253@gmail.com
git config --global core.editor vim

ln -sf ~/dotfiles/.vimrc ~/.vimrc
mkdir -p ~/.config/nvim
ln -sf ~/dotfiles/dein.toml ~/.config/nvim/dein.toml
ln -sf ~/dotfiles/.zshrc ~/.zshrc 

