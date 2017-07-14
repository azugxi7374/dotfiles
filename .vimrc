" * 検索時にエラー


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
" dein.vim
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=$HOME/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.vim/dein')
    call dein#begin('~/.vim/dein')

    " Let dein manage dein
    " Required:
    call dein#add('$HOME/.vim/dein/repos/github.com/Shougo/dein.vim')

    " Add or remove your plugins here:
    call dein#add('Shougo/neosnippet.vim')
    call dein#add('Shougo/neosnippet-snippets')

    " You can specify revision/branch/tag.
    call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

    " Required:
    filetype plugin indent on
    syntax enable

    "

    " -----------------------------------------------
    " -----------------------------------------------
    " -----------------------------------------------
    call dein#add('vim-scripts/vim-auto-save')
    let g:auto_save = 1
    let g:auto_save_in_insert_mode = 0

    " -----------------------------------
    "  View
    " -----------------------------------
    " colorshchemes----------------------
    call dein#add('29decibel/codeschool-vim-theme')
    call dein#add('altercation/vim-colors-solarized')
    call dein#add('chriskempson/vim-tomorrow-theme')
    call dein#add('ciaranm/inkpot')
    call dein#add('djjcast/mirodark')
    call dein#add('jnurmine/Zenburn')
    call dein#add('jonathanfilip/vim-lucius')
    call dein#add('jpo/vim-railscasts-theme')
    call dein#add('morhetz/gruvbox')
    call dein#add('nanotech/jellybeans.vim')
    call dein#add('sickill/vim-monokai')
    call dein#add('sjl/badwolf')
    call dein#add('tomasr/molokai')
    call dein#add('vim-scripts/BusyBee')
    call dein#add('vim-scripts/darktango.vim')
    call dein#add('vim-scripts/phd')
    call dein#add('vim-scripts/rdark')
    call dein#add('vim-scripts/twilight')
    call dein#add('vim-scripts/Wombat')
    call dein#add('w0ng/vim-hybrid')

    " Unite colorscheme -auto-preview
    call dein#add('ujihisa/unite-colorscheme')

    call dein#add('cohama/vim-insert-linenr')

    " -----------------------------------------------
    " -----------------------------------------------
    "  ウィンドウとか...
    " -----------------------------------------------
    " http://qiita.com/jnchito/items/5141b3b01bced9f7f48f
    call dein#add('Shougo/unite.vim')
    call dein#add('Shougo/neomru.vim')
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
    call dein#add('itchyny/lightline.vim')
    let g:lightline = {
                \ 'colorscheme': 'wombat',
                \}

    " -----------
    call dein#add('Shougo/vimfiler')
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
    call dein#add('easymotion/vim-easymotion')
    call dein#add('haya14busa/vim-migemo')
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
    call dein#add('rhysd/clever-f.vim')
    let g:clever_f_ignore_case = 1
    let g:clever_f_use_migemo = 1


    " -------------------------
    "  scroll
    call dein#add('yonchu/accelerated-smooth-scroll')
    nmap <PageDown> <C-d>
    nmap <PageUp> <C-u>
    let g:ac_smooth_scroll_du_sleep_time_msec = 1
    let g:ac_smooth_scroll_fb_sleep_time_msec = 1


    " --------------------------------------------------
    " outline
    " --------------------------------------------------
    call dein#add("Shougo/unite-outline")
    nnoremap <silent> ,outline :<C-u>Unite -vertical -winwidth=30 -no-quit outline<CR>

    " --------------------------------------------------
    " 言語
    " --------------------------------------------------
    call dein#add('derekwyatt/vim-scala')
    call dein#add('kchmck/vim-coffee-script')

    " Required:
    call dein#end()
    call dein#save_state()
endif
" If you want to install not installed plugins on startup.
if dein#check_install()
    call dein#install()
endif
"End dein Scripts-------------------------


" --------------------------------------------------
" --------------------------------------------------
" --------------------------------------------------
" --------------------------------------------------
" --------------------------------------------------
filetype plugin indent on

colorscheme hybrid
set background=dark
syntax on
