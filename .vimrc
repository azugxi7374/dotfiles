" TODO:
" * 検索時にエラー
" * NeoBundle?見直し. dein.vimにする
" * 全体的に見直し


" -------------------------------------
" file -------------
set encoding=utf-8
set fenc=utf-8
set fencs=guess,utf-8,cp932
set ff=unix
set noswapfile
set nobackup
set noundofile
" autocmd BufWritePre * :%s/\s\+$//ge	 " 保存時に行末の空白を除去する


" Indent -----------
set tabstop=4
set autoindent
set smartindent
set expandtab
set shiftwidth=4
" 改行時のコメントアウトを無効
" autocmd FileType * setlocal formatoptions-=ro 動かない

" 表示---------------
set number
set relativenumber
set wrap
set list
set listchars=eol:¬,tab:>-,extends:>,precedes:<
" Two-byte space
" autocmd ColorScheme * hi link TwoByteSpace Error
" autocmd VimEnter,WinEnter * let w:m_tbs = matchadd("TwoByteSpace", '　')

" set spell
" set spelllang=en,cjk

set cursorline

" アクティブウィンドウに限りカーソル行(列)を強調する
augroup vimrc_set_cursorline_only_active_window
  autocmd!
  autocmd VimEnter,BufWinEnter,WinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

" nomal modeでIMEをoff
augroup InsModeAu
    autocmd!
    autocmd InsertEnter,CmdwinEnter * set noimdisable
    autocmd InsertLeave,CmdwinLeave * set imdisable
augroup END

" セッション--------------
" au VimLeave * mks! $DROPBOX/_setting/vim/.session
" source $DROPBOX/_setting/vim/.session


" その他-----------------
set wildmenu
set clipboard=unnamed,unnamedplus

" set mouse=a
" set ttymouse=xterm2

" ----------------------------------
"  Key Mapping
"  ---------------------------------
" 編集とか
nnoremap Y y$
" 改行
nnoremap <CR> i<CR><ESC>
nnoremap <C-CR> O<ESC>
inoremap <C-CR> <ESC>O
nnoremap <S-CR> o<ESC>
inoremap <S-CR> <ESC>o


" 移動 & スクロール
" nnoremap <C-y> <C-y>k
" nnoremap <C-e> <C-e>j
nnoremap <PageUp> <C-u>
nnoremap <PageDown> <C-d>
nnoremap <C-\> $
nnoremap h <BS>
nnoremap l <Space>


" 挿入モード
inoremap <C-d> <DEL>
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-n> <Down>
inoremap <C-p> <Up>
inoremap <C-Space> <C-n>
inoremap <C-a> <Home>
inoremap <C-e> <End>

" タブ
nnoremap <C-Tab> gt
inoremap <C-Tab> <ESC>gt
nnoremap <C-S-Tab> gT
inoremap <C-S-Tab> <ESC>gT

" ウィンドウ
nnoremap <C-j> <C-W>w
nnoremap <C-k> <C-W>W

nnoremap <C-g> 1<C-g>
nnoremap <C-S-v> <C-v>



" --------------------------------------------------
"  NeoBundle
" (↓windowsだと自動インストールされないので手打ちする)
" (Macも駄目だった)
if has('vim_starting')
  set nocompatible
  " neobundle をインストールしていない場合は自動インストール
  if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
    echo "install neobundle..."
    :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
  endif
  " runtimepath の追加は必須
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
" } NeoBundle install
"
" --------------------------------------------------
" { NeoBundle begin
call neobundle#begin(expand('~/.vim/bundle'))
let g:neobundle_default_git_protocol='https'

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc.vim', {
          \ 'build' : {
          \     'windows' : 'make -f make_mingw32.mak',
          \     'cygwin' : 'make -f make_cygwin.mak',
          \     'mac' : 'make -f make_mac.mak',
          \     'unix' : 'make -f make_unix.mak',
          \    },
          \ }

" -----------------------------------------------
" -----------------------------------------------
" -----------------------------------------------
NeoBundle 'vim-scripts/vim-auto-save'
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0

" -----------------------------------
"  View
" -----------------------------------
" colorshchemes----------------------
NeoBundle '29decibel/codeschool-vim-theme'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'ciaranm/inkpot'
NeoBundle 'djjcast/mirodark'
NeoBundle 'jnurmine/Zenburn'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'morhetz/gruvbox'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'sickill/vim-monokai'
NeoBundle 'sjl/badwolf'
NeoBundle 'tomasr/molokai'
NeoBundle 'vim-scripts/BusyBee'
NeoBundle 'vim-scripts/darktango.vim'
NeoBundle 'vim-scripts/phd'
NeoBundle 'vim-scripts/rdark'
NeoBundle 'vim-scripts/twilight'
NeoBundle 'vim-scripts/Wombat'
NeoBundle 'w0ng/vim-hybrid'

" Unite colorscheme -auto-preview
NeoBundle 'ujihisa/unite-colorscheme'

NeoBundle 'cohama/vim-insert-linenr'

" -----------------------------------------------
" -----------------------------------------------
"  ウィンドウとか...
" -----------------------------------------------
" http://qiita.com/jnchito/items/5141b3b01bced9f7f48f
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
" http://blog.ruedap.com/2011/01/10/vim-unite-plugin
" 入力モードで開始する
" let g:unite_enable_start_insert=1
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q


" status line ----------------------------------
NeoBundle 'itchyny/lightline.vim'
let g:lightline = {
            \ 'colorscheme': 'wombat',
            \}

" -----------
NeoBundle 'Shougo/vimfiler'
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0

noremap ,vf :VimFiler -split -simple -winwidth=45 -no-quit<ENTER>
let g:vimfiler_ignore_pattern = ['']




" -----------------------------------------------
"  移動系
" -----------------------------------------------
"  http://haya14busa.com/mastering-vim-easymotion/
"  https://github.com/easymotion/vim-easymotion
"  http://qiita.com/himinato/items/caf5a0b19ce893a75363
NeoBundle 'easymotion/vim-easymotion'
NeoBundle 'haya14busa/vim-migemo'
let g:EasyMotion_do_mapping = 0
map <Leader>s <Plug>(easymotion-s2)
nmap <Leader>t <Plug>(easymotion-t2)

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

map <Leader>f <Plug>(easymotion-f)
map <Leader>t <Plug>(easymotion-t)
map <Leader>F <Plug>(easymotion-F)
map <Leader>T <Plug>(easymotion-T)

map <Leader>w <Plug>(easymotion-bd-w)
map <Leader>e <Plug>(easymotion-bd-e)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
let g:EasyMotion_keys = 'ASFHJKLZXCVBNMWERTYUP012345789'
let g:EasyMotion_use_upper = 1
let g:EasyMotion_smartcase = 1
" Jump to first match with enter & space
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1
let g:EasyMotion_use_migemo = 1

" clever-f ---------------------
NeoBundle 'rhysd/clever-f.vim'
let g:clever_f_ignore_case = 1
let g:clever_f_use_migemo = 1


" -------------------------
"  scroll
NeoBundle 'yonchu/accelerated-smooth-scroll'
nmap <PageDown> <C-d>
nmap <PageUp> <C-u>
let g:ac_smooth_scroll_du_sleep_time_msec = 1
let g:ac_smooth_scroll_fb_sleep_time_msec = 1


" --------------------------------------------------
" outline
" --------------------------------------------------
NeoBundle "Shougo/unite-outline"
nnoremap <silent> ,outline :<C-u>Unite -vertical -winwidth=30 -no-quit outline<CR>

" --------------------------------------------------
" 言語
" --------------------------------------------------
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'kchmck/vim-coffee-script'


" --------------------------------------------------
" --------------------------------------------------
" --------------------------------------------------
" --------------------------------------------------
" --------------------------------------------------
NeoBundleCheck
" NeoBundleUpdate
" NeoBundleClean
" NeoBundleLazy
call neobundle#end()
filetype plugin indent on

colorscheme hybrid
set background=dark
syntax on
