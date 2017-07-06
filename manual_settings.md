手動設定

# システム関連
## zsh
```
brew install zsh
sudo vi -u NONE /etc/shells
chsh -s /usr/local/bin/zsh
```

## キーボード関連
### キーボード→入力ソース→入力モード
* 半角カタカナ
* ライブ変換
### ⌘英かな
* ⌘ L -> ^Space,
* ^] -> Esc
(マウスクリック設定したい...)

## Finder
* Homeを追加。その他必要なものを追加

## トラックパッド
* タップでクリック（defaultsしてるのになんか効かない）
* アプリケーションExpose


# インストールしたアプリの確認
セキュリティとか起動設定とか

# 言語系
envから手動インストール
```
pyenv install anaconda3-4.3.1
pyenv global anaconda3-4.3.1
```

sshの設定（あとで自動化）
