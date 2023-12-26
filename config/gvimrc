" display & information
set lines=25        " typical
set columns=90      " margin for 'number' and 'foldcolumn'
set cmdheight=1     " MacVim $VIM/gvimrc overwrites my .vimrc settings
set guioptions=c    " show no GUI components

" no way to use a mouse
set mouse=
set nomousefocus
set mousehide

" font
if has('win32')
    " When VL Gothic isn't found in the system, use MS Gothic.
  " set guifont=Ricty_for_Powerline:h12:cANSI
  set guifont=Cica:h12:cANSI
    set linespace=0
elseif has('mac')
    set guifont=VL_Gothic:h16
    set linespace=0
endif

" turn off disabling IM at entering input mode
if exists('&imdisableactivate')
    set noimdisableactivate
endif
set guioptions-=T
set guioptions-=m
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=b
