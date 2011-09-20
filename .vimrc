" Follow me on Twitter @ryankanno

" --------------------------------------------------------------------------- "
" abbreviations
" --------------------------------------------------------------------------- "

iab _me Ryan Kanno <ryankanno@localkinegrinds.com>
iab _date <C-R>=strftime("%A, %B %e %Y %I:%M:%S %p %Z")<CR>

" --------------------------------------------------------------------------- "
" general
" --------------------------------------------------------------------------- "

set nocompatible                " disable older vi compatibility 
set modeline                    " respect other
set encoding=utf-8              " use utf-8 encoding 

set number                      " set line numbers 

set ruler                       " show ruler 
set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)

set laststatus=1                " always show last status

set history=1000                " 1000 lines of history 
set undolevels=500              " 500 levels of undo
set clipboard=unnamed           " share clipboard with win
set ffs=unix,dos,mac            " set file format to unix, win, then old mac
set hidden                      " enable hidden files 
set backspace=indent,eol,start  " enable backspace over indent, EOL, START

set backupext=.bak              " append .bak to backup files
set backupdir=$HOME/.vim_backups    " directory to store backup files 
set directory=$HOME/.vim_swaps      " directory to store swap files 
set autowrite                   " enable buffers to be saved on suspend

cmap cwd lcd %:p:h              " change working directory to that of file

" --------------------------------------------------------------------------- "
" themes
" --------------------------------------------------------------------------- "

if has("syntax")
    syntax on
endif

set background=dark             " sets the background color (I like it dark)
"colorscheme desert             " <3 desert/molokai ftw.
colorscheme molokai             " <3 colorscheme ftw.

" --------------------------------------------------------------------------- "
" visual
" --------------------------------------------------------------------------- "

set cursorline                  " highlight current line

set nowrap                      " nowrap
set showcmd                     " show cmd
set showmatch                   " show matching brackets
set showbreak=...               " show '...' if line is longer than screen
set mat=5                       " how many tenths of a second to blink matching brackets
set incsearch                   " show search matches as you type
set lines=58                    " height
set columns=180                 " width
set novisualbell                " no error bells
set noerrorbells                " no error bells
set title                       " sets the title
set wildmenu                    " show autocomplete options
set textwidth=79                " sets the text width
set tabpagemax=10 				" show 10 tabs

" highlight lines over 80 characters
highlight OverLength ctermbg=darkred ctermfg=white guibg=#AE0000
match OverLength /\%80v.\+/

" --------------------------------------------------------------------------- "
" search
" --------------------------------------------------------------------------- "

set ignorecase                  " case insensitive search
set smartcase
set magic                       " enable advanced regular expressions
set hlsearch                    " enables highlighting search

" --------------------------------------------------------------------------- "
" text
" --------------------------------------------------------------------------- "

set autoindent                  " use curr line's indent to set indent of new line 
set smartindent                 " vim guesses indent level 
set tabstop=4     
set softtabstop=4 
set shiftwidth=4
set expandtab
set gdefault					" the /g flag on :s substitutions by default

" --------------------------------------------------------------------------- "
" folding
" --------------------------------------------------------------------------- "

set foldenable                  " enable folding
set foldmethod=marker
set foldlevel=0
set commentstring=\ #\ %s

" --------------------------------------------------------------------------- "
" folding
" --------------------------------------------------------------------------- "

filetype plugin on
autocmd FileType css setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

" --------------------------------------------------------------------------- "
" command line
" --------------------------------------------------------------------------- "

" bash like commands
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" --------------------------------------------------------------------------- "
" keyboard mapping
" --------------------------------------------------------------------------- "

" simplify window navigation with ctrl
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h
map <C-K> <C-W>k

" simplify tabbed navigation with ctrl
map <C-H> gT
map <C-L> gt

" <Leader>cd switches to directory of open buffer
map <Leader>cd :cd %:p:h<CR>

" <Leader>f to start an Ack search
map <Leader>f :Ack<space>

" <Leader>Ss to open scratch in split window
map <Leader>Ss :Sscratch<CR>

" <Leader>s to open scratch buffer in same window
map <Leader>s :Scratch<CR>

" <Leader>dc to show diff of current buffer
map <Leader>dc :DiffChangesDiffToggle<CR>

" <Leader>dc to show patch of current buffer
map <Leader>dp :DiffChangesPatchToggle<CR>

" <Leader>o to open bufExplorer
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
map <Leader>o :BufExplorerVerticalSplit<CR>

" <F2> to toggle invisible characters
map <silent> <F2> :set invlist<CR>

" <Leader>T to flush command-t
set wildignore+=*.o,*.obj,.git,.svn,.hg,*.pyc
map <Leader>t :CommandT<CR>
map <Leader>T :CommandTFlush<CR>

" <Leader>W to clean whitespace
map <Leader>W :%s/\s\+$//<CR>:let @/=''<CR>

" CTags
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>

" <Leader>tl to open Taglist project
let Tlist_WinWidth = 50
map <Leader>tl :TlistToggle<CR>

" <Leader><Leader> to ZoomWin 
map <Leader><Leader> :ZoomWin<CR>

" <Leader>x to show TODO list
map <Leader>x <Plug>TaskList

" Source a local config to override stuffs
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif

" --------------------------------------------------------------------------- "
" plugins
" --------------------------------------------------------------------------- "

" allow pathogen to update runtime path
call pathogen#runtime_append_all_bundles()
