##### ref #####
# http://qiita.com/djmonta/items/17531dde1e82d9786816
# http://tukaikta.blog135.fc2.com/blog-entry-251.html


###### Dock ######
# Automatically hide or show the Dock （Dock を自動的に隠す）
defaults write com.apple.dock autohide -bool true
# 位置
defaults write com.apple.dock orientation -string "left"
# Wipe all app icons from the Dock （Dock に標準で入っている全てのアプリを消す、Finder とごみ箱は消えない）
# defaults write com.apple.dock persistent-apps -array
# Set the icon size （アイコンサイズの設定）
defaults write com.apple.dock tilesize -int 30
# Magnificate the Dock （Dock の拡大機能を入にする）
defaults write com.apple.dock magnification -bool true
# 最近使った項目を表示（フォルダ側）
defaults write com.apple.dock persistent-others -array-add '{ "tile-data" = { "list-type" = 1; }; "tile-type" = "recents-tile"; }'
# Dockをすぐに表示する
defaults write com.apple.dock autohide-delay -float 0

##### Trackpad #####
# Enable `Tap to click` （タップでクリックを有効にする）
# タップでクリック
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
# defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
# defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

##### Keyboard #####
# リピート入力認識までの時間 normal minimum is 15 (225 ms)
defaults write -g InitialKeyRepeat -int 10 # 150ms
# KeyRepert # normal minimum is 2 (30 ms)
defaults write -g KeyRepeat -int 2 # 15ms
# ファンクションキー
defaults write NSGlobalDomain com.apple.keyboard.fnState -bool true


##### Finder #####
## 表示系 ##
# カラムビュー表示
defaults write com.apple.finder FXPreferredViewStyle clmv
# 隠しファイルをFinder上で可視化する
defaults write com.apple.finder AppleShowAllFiles true
# 全ての拡張子を表示
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Show Status bar in Finder （ステータスバーを表示）
defaults write com.apple.finder ShowStatusBar -bool true
# Show Path bar in Finder （パスバーを表示）
defaults write com.apple.finder ShowPathbar -bool true
# Show Tab bar in Finder （タブバーを表示）
defaults write com.apple.finder ShowTabView -bool true
# Show the ~/Library directory （ライブラリディレクトリを表示、デフォルトは非表示）
chflags nohidden ~/Library
# フルパス表示
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
## 機能系 ##
# 新しいウィンドウでデフォルトでホームフォルダを開く
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"
# QuickLookでテキスト選択可能に
defaults write com.apple.finder QLEnableTextSelection -bool true
# 他のウィンドウに移った時にQuick Lookを非表示にする
defaults write com.apple.finder QLHidePanelOnDeactivate -bool true

##### etc #####
# Avoid creating `.DS_Store` files on network volumes （ネットワークディスクで、`.DS_Store` ファイルを作らない）
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
# バッテリーのパーセント表示
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
# 日付と時刻のフォーマット
defaults write com.apple.menuextra.clock DateFormat -string "M\u6708d\u65e5(EEE)  H:mm:ss"
# スクショの場所
defaults write com.apple.screencapture location ~/Pictures/screenshot/











