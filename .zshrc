########################################
# 環境変数
export LANG=ja_JP.UTF-8

export PATH="$HOME/bin_local:$PATH"
export PATH="$HOME/bin_common:$PATH"

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export VIRTUAL_ENV_DISABLE_PROMPT=1

export PATH="$HOME/.nodebrew/current/bin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

export BROWSER=open
export CLICOLOR=1

## go
export GOPATH="$HOME/go"
export PATH=$GOPATH/bin:$PATH


# 色を使用出来るようにする
autoload -Uz colors
colors

# emacs 風キーバインドにする
bindkey -e

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# プロンプト
PROMPT="%{${fg[green]}%}[%n@%m]%{${reset_color}%} (%*%) %~
%# "

# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

########################################
# 補完
# 補完機能を有効にする
autoload -Uz compinit
compinit

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'


########################################
# vcs_info
autoload -Uz vcs_info
autoload -Uz add-zsh-hook

zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'

function _update_vcs_info_msg() {
    LANG=en_US.UTF-8 vcs_info
    RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg


########################################
# オプション
# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beep を無効にする
setopt no_beep

# フローコントロールを無効にする
setopt no_flow_control

# Ctrl+Dでzshを終了しない
setopt ignore_eof

# '#' 以降をコメントとして扱う
setopt interactive_comments

# ディレクトリ名だけでcdする
setopt auto_cd

# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 高機能なワイルドカード展開を使用する
setopt extended_glob

########################################
# キーバインド

# ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
bindkey '^R' history-incremental-pattern-search-backward

########################################
# エイリアス
excmd() { type $1 >/dev/null 2>&1 }

alias ls='ls --color'

alias la='ls -a'
alias ll='ls -l'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# alias less='less -IRMNW'
export LESS='-IRMNW'


alias mkdir='mkdir -p'

alias uniq='LC_ALL=C uniq'

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

alias L='less'
alias G='grep'

alias shrestart='exec -l $SHELL'

alias trs='rmtrash'

if excmd colordiff; then
    alias diff='colordiff'
fi
if excmd nvim; then
    alias vim='nvim'
fi

if excmd highlight; then
    # alias hl='env FORCE_COLOR=1 highlight'
    hl() { env FORCE_COLOR=1 highlight $* }
    lhl() { hl $* | less }
fi

if excmd pbcopy; then
    alias C='pbcopy'
fi
if excmd pbpaste; then
    alias P='pbpaste'
fi

if excmd jq; then
    alias jqc='jq -C'
    jql() {
        case $# in
            0 ) jq -C '.' | less ;;
            1 ) jq -C '.' $1 | less;;
            * ) jq -C $* | less;;
        esac
    }
fi


# cdのあとlaを実行
chpwd() { ls -ax }

# TRAPINT() {
  # print '(ﾉ`Д´)ﾉ.:･┻┻ ｵﾘｬｰ'
  # return $(( 128 + $1 ))
# }

# PATHの重複を削除
typeset -U PATH

[ -f ~/.iterm2_shell_integration.zsh ] && source ~/.iterm2_shell_integration.zsh
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
