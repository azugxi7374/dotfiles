if [ ! -d "$DOTFILES_DIR" ] ; then
    echo 'set DOTFILES_DIR !'
    exit 1
fi

echo "DOTFILES_DIR=$DOTFILES_DIR"

alias ynq="$DOTFILES_DIR/bin/ynq"

if ynq "setup synbolic links?" ; then
    ln -sf $DOTFILES_DIR/.vimrc ~/.vimrc
    mkdir -p ~/.config/nvim
    ln -sf $DOTFILES_DIR/dein.toml ~/.config/nvim/dein.toml
    ln -sf $DOTFILES_DIR/.zshrc ~/.zshrc 
    ln -sf $DOTFILES_DIR/bin ~/bin_common
    ln -sf $DOTFILES_DIR/lib/jq ~/.jq
fi

if ynq "setup homebrew?" ; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew update
    brew tap caskroom/cask
fi

if ynq "setup git config?" ; then
    git config --global user.name "ixguza"
    git config --global user.email rtk0253@gmail.com
    git config --global core.editor vim
fi

