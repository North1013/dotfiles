if &compatible
  set nocompatible
endif

set shell=bash

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'sirtaj/vim-openscad'
" NERDTree
" Plugin 'scrooloose/nerdtree'
" Plugin 'Xuyuanp/nerdtree-git-plugin'
" git wrapper
Plugin 'tpope/vim-fugitive'
" linter
Plugin 'w0rp/ale'
" syntax checker
" Plugin 'scrooloose/syntastic'
" autocomplete
Plugin 'valloric/youcompleteme'
" completes ( with )
Plugin 'jiangmiao/auto-pairs'
" Nord theme for vim
Plugin 'arcticicestudio/nord-vim'
" show css colors directly in file
Plugin 'ap/vim-css-color'
" fuzzy finder
" Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
" use the virtualenv instead of global/user
Plugin 'jmcantrell/vim-virtualenv'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" set Nord as colorscheme
colorscheme nord

set autoindent
set cindent
set nowrap
set backspace=indent,eol,start
set ruler
set suffixes+=.aux,.bbl,.blg,.brf,.cb,.dvi,.idx,.ilg,.ind,.inx,.jpg,.log,.out,.png,.toc
set suffixes-=.h
set suffixes-=.obj
set number
set numberwidth=5
set cursorline
set relativenumber
set incsearch

syntax on

" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

filetype plugin indent on    " required

" Move temporary files to a secure location to protect against CVE-2017-1000382
if exists('$XDG_CACHE_HOME')
  let &g:directory=$XDG_CACHE_HOME
else
  let &g:directory=$HOME . '/.cache'
endif
let &g:undodir=&g:directory . '/vim/undo//'
let &g:backupdir=&g:directory . '/vim/backup//'
let &g:directory.='/vim/swap//'

" Create directories if they doesn't exist
if ! isdirectory(expand(&g:directory))
  silent! call mkdir(expand(&g:directory), 'p', 0700)
endif
if ! isdirectory(expand(&g:backupdir))
  silent! call mkdir(expand(&g:backupdir), 'p', 0700)
endif
if ! isdirectory(expand(&g:undodir))
  silent! call mkdir(expand(&g:undodir), 'p', 0700)
endif

" Make shift-insert work like in Xterm
if has('gui_running')
	map <S-Insert> <MiddleMouse>
	map! <S-Insert> <MiddleMouse>
endif

" Syntax checker settings
set laststatus=2
set statusline+=\ %f
set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" choosing the syntax checker for filetype:
" https://github.com/vim-syntastic/syntastic/blob/master/doc/syntastic-checkers.txt
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_sh_checkers = ['shellcheck']

" YouCompleteMe
let g:ycm_server_python_interpreter = '/usr/bin/python3'
" let g:ycm_key_list_stop_completion = ['<C-y>', '<CR>']
let g:ycm_global_ycm_extra_con = '/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" Bind fzf to Ctrl-P
nnoremap <silent> <C-p> :FZF -m<cr>

" CtrlP
" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'
