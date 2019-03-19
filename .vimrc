"
"  __   __   __     __    __     ______     ______    
" /\ \ / /  /\ \   /\ "-./  \   /\  == \   /\  ___\   
" \ \ \'/   \ \ \  \ \ \-./\ \  \ \  __<   \ \ \____  
"  \ \__|    \ \_\  \ \_\ \ \_\  \ \_\ \_\  \ \_____\ 
"   \/_/      \/_/   \/_/  \/_/   \/_/ /_/   \/_____/ 
"                                                     

set fileformats=unix,dos,mac
set encoding=utf-8
scriptencoding utf-8

" 推奨設定の読み込み (:h defaults.vim)
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim
    if !isdirectory(expand('~/vimfiles/autoload'))
      echo 'install vim-plug...'
      call system('mkdir -p ~/vimfiles/autoload/')
      call system('mkdir -p ~/vimfiles/plugged')
      call system('curl -fLo ~/vimfiles/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
    end

if has('vim_starting')
  let &t_SI .= "\e[6 q"
  let &t_EI .= "\e[2 q"
  let &t_SR .= "\e[4 q"
  if has ('win32')
    set rtp+=~/vimfiles/autoload
    if !isdirectory(expand('~/vimfiles/autoload'))
      echo 'install vim-plug...'
      call system('mkdir -p ~/vimfiles/autoload/')
      call system('mkdir -p ~/vimfiles/plugged')
      call system('curl -fLo ~/vimfiles/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
    end
  else
    set rtp+=~/.vim/autoload
    if !isdirectory(expand('~/.vim/autoload'))
      echo 'install vim-plug...'
      call system('mkdir -p ~/.vim/autoload/')
      call system('mkdir -p ~/.vim/plugged')
      call system('curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
    end
  endif
endif

" Plugin package manager
call plug#begin()
  " Powerline
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'ryanoasis/vim-devicons'
  Plug 'bling/vim-bufferline'

  " WindowResize
  Plug 'simeji/winresizer'

  " file template
  Plug 'mattn/sonictemplate-vim'

  " easymotion
  Plug 'Lokaltog/vim-easymotion'

  " git
  Plug 'tpope/vim-fugitive'

  " color scheme
  Plug 'sjl/badwolf'

  " todo.txt Plugin
  Plug 'freitass/todo.txt-vim'

  " fileManager
  " Plug 'scrooloose/nerdtree'
  " Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'Shougo/unite.vim'
  Plug 'Shougo/vimfiler.vim'

  " SNS
  Plug 'wakatime/vim-wakatime'

  " golang plugin
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

  " cheatsheet
  Plug 'reireias/vim-cheatsheet'

  " Lint
  Plug 'W0rp/ale'

  " markdown
  " Plug 'suan/vim-instant-markdown'

call plug#end()
"===============================================================================
" 設定の追加はこの行以降でおこなうこと！
" 分からないオプション名は先頭に ' を付けてhelpしましょう。例:
" :h 'helplang

" packadd! vimdoc-ja                " 日本語help の読み込み
set helplang=ja,en                " help言語の設定

set scrolloff=0
set laststatus=2                  " 常にステータス行を表示する
set cmdheight=2                   " hit-enter回数を減らすのが目的
if !has('gui_running')            " gvimではない？ (== 端末)
  set mouse=                      " マウス無効 (macOS時は不便かも？)
  set ttimeoutlen=0               " モード変更時の表示更新を最速化
  if $COLORTERM == "truecolor"    " True Color対応端末？
    set termguicolors
  endif
endif
set nofixendofline                " Windowsのエディタの人達に嫌われない設定
set ambiwidth=double              " ○, △, □等の文字幅をASCII文字の倍にする
set directory-=.                  " swapファイルはローカル作成がトラブル少なめ
set formatoptions+=mM             " 日本語の途中でも折り返す
let &grepprg="grep -rnIH --exclude=.git --exclude-dir=.hg --exclude-dir=.svn --exclude=tags"
let loaded_matchparen = 1         " カーソルが括弧上にあっても括弧ペアをハイライトさせない

" :grep 等でquickfixウィンドウを開く (:lgrep 等でlocationlistウィンドウを開く)
"augroup qf_win
"  autocmd!
"  autocmd QuickfixCmdPost [^l]* copen
"  autocmd QuickfixCmdPost l* lopen
"augroup END

" マウスの中央ボタンクリックによるクリップボードペースト動作を抑制する
noremap <MiddleMouse> <Nop>
noremap! <MiddleMouse> <Nop>
noremap <2-MiddleMouse> <Nop>
noremap! <2-MiddleMouse> <Nop>
noremap <3-MiddleMouse> <Nop>
noremap! <3-MiddleMouse> <Nop>
noremap <4-MiddleMouse> <Nop>
noremap! <4-MiddleMouse> <Nop>

"-------------------------------------------------------------------------------
" ステータスライン設定
let &statusline = "%<%f %m%r%h%w[%{&ff}][%{(&fenc!=''?&fenc:&enc).(&bomb?':bom':'')}] "
if has('iconv')
  let &statusline .= "0x%{FencB()}"

  function! FencB()
    let c = matchstr(getline('.'), '.', col('.') - 1)
    if c != ''
      let c = iconv(c, &enc, &fenc)
      return s:Byte2hex(s:Str2byte(c))
    else
      return '0'
    endif
  endfunction
  function! s:Str2byte(str)
    return map(range(len(a:str)), 'char2nr(a:str[v:val])')
  endfunction
  function! s:Byte2hex(bytes)
    return join(map(copy(a:bytes), 'printf("%02X", v:val)'), '')
  endfunction
else
  let &statusline .= "0x%B"
endif
let &statusline .= "%=%l,%c%V %P"

"-------------------------------------------------------------------------------
" ファイルエンコーディング検出設定
let &fileencoding = &encoding
if has('iconv')
  if &encoding ==# 'utf-8'
    let &fileencodings = 'iso-2022-jp,euc-jp,cp932,' . &fileencodings
  else
    let &fileencodings .= ',iso-2022-jp,utf-8,ucs-2le,ucs-2,euc-jp'
  endif
endif
 " 日本語を含まないファイルのエンコーディングは encoding と同じにする
 if has('autocmd')
   function! AU_ReSetting_Fenc()
     if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
       let &fileencoding = &encoding
     endif
   endfunction
   augroup resetting_fenc
     autocmd!
     autocmd BufReadPost * call AU_ReSetting_Fenc()
   augroup END
 endif
"-------------------------------------------------------------------------------
" カラースキームの設定
colorscheme badwolf
syntax on

try
  silent hi CursorIM
catch /E411/
  " CursorIM (IME ON中のカーソル色)が定義されていなければ、紫に設定
  hi CursorIM ctermfg=16 ctermbg=127 guifg=#000000 guibg=#af00af
endtry

"-------------------------------------------------------------------------------
" 個人設定
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" Undoファイルは作成しない
set noundofile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" Clipboard有効化
set clipboard+=unnamed
" quickfix
autocmd QuickFixCmdPost *grep* cwindow

" キーバインド
" leader
let mapleader = "\<Space>"
let maplocalleader = "`"

" 折り返し時に表示行単位での移動できるようにする
nmap j gj
nmap k gk

" ページめくり
nmap J <C-f>
nmap K <C-b>

" buffer切替
nmap <silent>sj :bn<CR>
nmap <silent>sk :bp<CR>

" sキー無効
nmap s <Nop>

"easymotion 
nmap s <Plug>(easymotion-s2)
xmap s <Plug>(easymotion-s2)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <leader><leader> <Plug>(easymotion-prefix)
map f <Plug>(easymotion-fl)
map t <Plug>(easymotion-tl)
map F <Plug>(easymotion-Fl)
map T <Plug>(easymotion-Tl)

" VimFiler キーマップ
nmap <leader>f :VimFilerBufferDir<Return>
nmap <leader>F :VimFilerExplorer -find<Return>
nmap <leader>b :Unite buffer<Return>

" ESCキーマップ
imap <silent>jj <ESC>
imap <silent>っｊ <ESC>

" 見た目系
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 現在の行を強調表示（縦）
set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest

" Tab系
" 不可視文字を可視化(タブが「?-」と表示される)
hi SpecialKey ctermfg=darkmagenta
set list listchars=tab:\?\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2


" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" airline関連
" Powerline系フォントを利用する
let g:airline_theme = 'badwolf'
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'y', 'z']]
" let g:airline_section_c = '%t'
" let g:airline_section_x = '%{&filetype}'
" let g:airline_section_z = '%3l:%2v %{airline#extensions#ale#get_warning()} %{airline#extensions#ale#get_error()}'


if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" VimFiler
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_enable_auto_cd = 0
let g:vimfiler_tree_leaf_icon = ''
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_marked_file_icon = '✓'

" easymotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0
let g:EasyMotion_keys = ';HKLYUIOPNM,QWERTASDGZXCVBJF'
" Show target key with upper case to improve readability
let g:EasyMotion_use_upper = 1
" Jump to first match with enter & space
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1

" template
let g:sonictemplate_vim_template_dir = ['~/.vim/template']

" cheat sheet
let g:cheatsheet#cheat_file = '~/.vim/.cheatsheet.md'

" Lint
let g:ale_lint_on_text_changed = 0
let g:ale_sign_error = '' 
let g:ale_sign_warning = '' 
" lint golang
" let g:ale_linters.go ='gometalinter'
" let g:ale_go_gometalinter_options = '--fast --enable=staticcheck --enable=gosimple --enable=unused'

let g:WebDevIconsUnicodeDecorateFolderNodes = 1

" Golang
let g:go_fmt_command = "goimports"
au FileType go nmap <leader>s <Plug>(go-def-split)
au FileType go nmap <leader>v <Plug>(go-def-vertical)
