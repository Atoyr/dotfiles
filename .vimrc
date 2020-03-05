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

" start once
if has('vim_starting')
  let &t_SI .= "\e[6 q"
  let &t_EI .= "\e[2 q"
  let &t_SR .= "\e[4 q"

  if has ('win32')
    let vimfiles = '%USERPROFILE%/vimfiles'
  else
    let vimfiles = '~/.vim'
  endif
  " vim-plug導入
  let autoload = vimfiles . '/autoload'
  set rtp+=autoload
  if !isdirectory(expand(autoload))
    echo 'install vim-plug...'
    call system('mkdir -p ' . autoload)
    call system('mkdir -p ' . vimfiles . '/plugged')
    call system('curl -fLo ' . autoload . '/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
  end
  unlet! vimfiles
  unlet! autoload
endif

" Plugin package manager
call plug#begin()
  " LSP
  Plug 'prabirshrestha/async.vim'
  Plug 'prabirshrestha/vim-lsp'
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'prabirshrestha/asyncomplete-lsp.vim'
  Plug 'natebosch/vim-lsc'
  Plug 'mattn/vim-lsp-settings'

  " Powerline
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'ryanoasis/vim-devicons'
  " Plug 'bling/vim-bufferline'

  " fzf
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'relastle/fzf-coalesce.vim'

  " WindowResize
  Plug 'simeji/winresizer'

  " file template
  Plug 'mattn/sonictemplate-vim'

  " easymotion
  Plug 'Lokaltog/vim-easymotion'
  Plug 'haya14busa/vim-migemo'

  " git
  Plug 'tpope/vim-fugitive'

  " color scheme
  Plug 'atoyr/badloris'

  " todo.txt Plugin
  Plug 'freitass/todo.txt-vim'

  " fileManager
   Plug 'scrooloose/nerdtree',{ 'on' : 'NERDTreeToggle' }
   Plug 'Xuyuanp/nerdtree-git-plugin'
  "Plug 'Shougo/unite.vim'
  "Plug 'Shougo/vimfiler.vim'

  " marker

  " edit it
  Plug 'tpope/vim-surround'
  Plug 'andymass/vim-matchup'

  " SNS
  " Plug 'wakatime/vim-wakatime'

  " golang plugin
  " Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  " Plug 'arp242/gopher.vim'
  Plug 'mattn/vim-goimports'

  " vue
  Plug 'posva/vim-vue'
  Plug 'alvan/vim-closetag'

  " js
  Plug 'pangloss/vim-javascript'

  " typescript
  Plug 'leafgarland/typescript-vim'

  " C#
  Plug 'OmniSharp/omnisharp-vim'

  " Dart
  Plug 'dart-lang/dart-vim-plugin'
  Plug 'thosakwe/vim-flutter' 

  " cheatsheet
  Plug 'reireias/vim-cheatsheet'

  " Lint
  Plug 'W0rp/ale'

  " markdown
  " Plug 'suan/vim-instant-markdown'

  " benchmark
  Plug 'mattn/benchvimrc-vim'

  " emoji
  Plug 'junegunn/vim-emoji'
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
set relativenumber

" :grep 等でquickfixウィンドウを開く (:lgrep 等でlocationlistウィンドウを開く)
augroup qf_win
  autocmd!
  autocmd QuickfixCmdPost [^l]* copen
  autocmd QuickfixCmdPost l* lopen
augroup END

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
" colorscheme badwolf
set background=dark
colorscheme badloris
syntax on

try
  silent hi CursorIM
catch /E411/
  " CursorIM (IME ON中のカーソル色)が定義されていなければ、紫に設定
  hi CursorIM ctermfg=16 ctermbg=127 guifg=#000000 guibg=#af00af
endtry

"-------------------------------------------------------------------------------
"undo設定
if has('persistent_undo')
  set undodir=~/.vim/undo
  set undofile
  set undolevels=1000
endif

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
" 画面を右に開く
set splitright
" 画面を下に開く
set splitbelow

" quickfix
autocmd QuickFixCmdPost *grep* cwindow

" キーバインド
" leader
let mapleader = "\<Space>"
let maplocalleader = "`"

" キー無効
nmap s <Nop>

" *検索時に先に進まないように
noremap * *N

" 指定個所を置換
nnoremap <Leader>re :%s;<C-R><C-W>;g<Left><Left>;

" 行頭行末
" map H ^
" map L $

nnoremap <silent> <Leader>l :belowright term ++close gol -f<CR>

" relativeNumber切り替え
nnoremap <silent> <Leader>n :set relativenumber!<CR>

nnoremap <C-j> }
nnoremap <C-k> {

" 折り返し時に表示行単位での移動できるようにする
nmap j gj
nmap k gk

" buffer切替
nmap <silent> <Leader>j :bn<CR>
nmap <silent> <Leader>k :bp<CR>

"easymotion 
nmap s <Plug>(easymotion-s2)
xmap s <Plug>(easymotion-s2)
map f <Plug>(easymotion-fl)
map t <Plug>(easymotion-tl)
map F <Plug>(easymotion-Fl)
map T <Plug>(easymotion-Tl)
" Move to word  => 使わないので廃止
" map  <Leader>w <Plug>(easymotion-bd-w)
" nmap <Leader>w <Plug>(easymotion-overwin-w)
nnoremap <Leader>z :vertical term<CR>

" VimFiler キーマップ
 nmap <leader>f :VimFilerBufferDir<Return>
 nmap <leader>F :VimFilerExplorer -find<Return>
 nmap <leader>b :Unite buffer<Return>
map <C-n> :NERDTreeToggle<CR>

" LSP キーマップ
nmap <silent> <Leader>d :LspDefinition<CR>
nmap <silent> <Leader>p :LspHover<CR>
nmap <silent> <Leader>r :LspReferences<CR>
nmap <silent> <Leader>i :LspImplementation<CR>

" split
nmap <silent> <Leader>s :split \| :LspDefinition <CR>
nmap <silent> <Leader>v :vsplit \| :LspDefinition <CR>

" ESCキーマップ
imap <silent>jj <ESC>
imap <silent>っｊ <ESC>

" fzf
nnoremap <silent> <localleader>f :GFiles<CR>
nnoremap <silent> <localleader>F :GFiles?<CR>
nnoremap <silent> <localleader>b :Buffers<CR>
nnoremap <silent> <localleader>l :BLines<CR>

" vim-go
" au FileType go nmap <leader>s <Plug>(go-def-split)
" au FileType go nmap <leader>v <Plug>(go-def-vertical)

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
set wildmenu
set wildmode=list:longest

" Tab系
" 不可視文字を可視化(タブが「?-」と表示される)
set list listchars=tab:\>\-
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
" let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'y', 'z']]
" let g:airline_section_c = '%t'
" let g:airline_section_x = '%{&filetype}'
" let g:airline_section_z = '%3l:%2v %{airline#extensions#ale#get_warning()} %{airline#extensions#ale#get_error()}'


let g:ale_linters = {
      \ 'html': [],
      \ 'css': ['stylelint'],
      \ 'javascript': ['eslint'],
      \ 'vue': ['eslint']
      \ }
let g:ale_linter_aliases = {'vue': 'css'}

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
if !exists('g:airline_powerline_fonts')
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
else

  " airline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif

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
let g:EasyMotion_use_migemo = 1

" template
let g:sonictemplate_vim_template_dir = ['~/.config/vim/template']

" cheat sheet
let g:cheatsheet#cheat_file = '~/.config/vim/cheatsheet.md'

" Lint
let g:ale_lint_on_text_changed = 0
let g:ale_sign_error = 'X' 
let g:ale_sign_warning = '!' 
" lint golang
" let g:ale_linters.go ='gometalinter'
" let g:ale_go_gometalinter_options = '--fast --enable=staticcheck --enable=gosimple --enable=unused'

let g:WebDevIconsUnicodeDecorateFolderNodes = 1

" Golang
let g:go_fmt_command = "goimports"
let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'
let g:go#use_vimproc = 0
"let g:go_snippet_engine = "minisnip"
let g:go_def_mapping_enabled = 0
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_term_enabled = 1
let g:go_highlight_build_constraints = 1
let g:go_template_autocreate = 0
let g:go_gocode_unimported_packages = 1
let g:sonictemplate_enable_pattern = 1
" debug
 " let g:lsp_log_verbose = 1
 " let g:lsp_log_file = expand('~/vim-lsp.log')
 " let g:asyncomplete_log_file = expand('~/asyncomplete.log')

let g:closetag_filenames = '*.html,*.vue'

" lsp
let g:lsp_async_completion = 1
let g:lsp_diagnostics_enabled = 0

" if executable('gopls')
"   augroup LspGo
"     au!
"     autocmd User lsp_setup call lsp#register_server({
"           \ 'name': 'gopls',
"           \ 'cmd': {server_info->['gopls']},
"           \ 'whitelist': ['go'],
"           \ })
"     autocmd FileType go setlocal omnifunc=lsp#complete
"   augroup END
" endif

" golang
function! s:gofmt_on_save()
  let l:curw = winsaveview()
  silent execute "0,$! gofmt"
  try | silent undojoin | catch | endtry
  call winrestview(l:curw)
endfunction

" miiton
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['vue'] = ''
" アイコン入力方法 : `[Ctrl+V]` > `[u]` > `e905`
let g:NERDTreeExtensionHighlightColor = {}
let g:NERDTreeExtensionHighlightColor['vue'] = '42B983'

if &term =~ '256color'
  set t_ut=
endif

" augroup vim-gofmt-autosave
"   autocmd!
"   autocmd BufWritePre *.go call s:gofmt_on_save()
" augroup END

" syntax hi group name
function! s:get_syn_id(transparent)
  let synid = synID(line("."), col("."), 1)
  if a:transparent
    return synIDtrans(synid)
  else
    return synid
  endif
endfunction
function! s:get_syn_attr(synid)
  let name = synIDattr(a:synid, "name")
  let ctermfg = synIDattr(a:synid, "fg", "cterm")
  let ctermbg = synIDattr(a:synid, "bg", "cterm")
  let guifg = synIDattr(a:synid, "fg", "gui")
  let guibg = synIDattr(a:synid, "bg", "gui")
  return {
        \ "name": name,
        \ "ctermfg": ctermfg,
        \ "ctermbg": ctermbg,
        \ "guifg": guifg,
        \ "guibg": guibg}
endfunction
function! s:get_syn_info()
  let baseSyn = s:get_syn_attr(s:get_syn_id(0))
  echo "name: " . baseSyn.name .
        \ " ctermfg: " . baseSyn.ctermfg .
        \ " ctermbg: " . baseSyn.ctermbg .
        \ " guifg: " . baseSyn.guifg .
        \ " guibg: " . baseSyn.guibg
  let linkedSyn = s:get_syn_attr(s:get_syn_id(1))
  echo "link to"
  echo "name: " . linkedSyn.name .
        \ " ctermfg: " . linkedSyn.ctermfg .
        \ " ctermbg: " . linkedSyn.ctermbg .
        \ " guifg: " . linkedSyn.guifg .
        \ " guibg: " . linkedSyn.guibg
endfunction
command! SyntaxInfo call s:get_syn_info()

