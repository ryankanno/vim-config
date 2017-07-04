"
" Ryan Kanno <ryankanno@gmail.com>
" @ryankanno
"

call pathogen#infect()

let g:user="Ryan Kanno"
let g:email="ryankanno@localkinegrinds.com"

" Abbreviations {{{
iab me@ Ryan Kanno <ryankanno@localkinegrinds.com>
iab date@ <C-R>=strftime("%A, %B %e %Y %I:%M:%S %p %Z")<CR>
" }}}

" General {{{
let mapleader=","               " set mapleader
set nocompatible                " disable older vi compatibility
set modeline                    " respect other
set encoding=utf-8              " use utf-8 encoding

set number                      " set line numbers

set ruler                       " show ruler
set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)

set laststatus=2                " always show last status

set history=1000                " 1000 lines of history
set undolevels=1000             " 1000 levels of undo
set clipboard+=unnamed          " share clipboard with win
set ffs=unix,dos,mac            " set file format to unix, win, then old mac
set hidden                      " enable hidden files
set backspace=indent,eol,start  " enable backspace over indent, EOL, START

if has("undodir")
    set undodir=$HOME/.vim_undo " directory to store backup files
    set undofile                " save undo history to an undo file"
    if ! isdirectory(expand(&undodir))
        call mkdir(&undodir, 'p', 0700 )
    endif
endif

set backupext=.bak               " append .bak to backup files

set backupdir=$HOME/.vim_backups " directory to store backup files
if ! isdirectory(expand(&backupdir))
    call mkdir(&backupdir, 'p', 0700)
endif

set directory=$HOME/.vim_swaps   " directory to store swap files
if ! isdirectory(expand(&directory))
    call mkdir(&directory, 'p', 0700)
endif

set autowrite                    " enable buffers to be saved on suspend
" }}}

" Theme {{{
if has("syntax")
    syntax on
endif

set background=dark             " sets the background color (I like it dark)
colorscheme molokai             " <3 colorscheme ftw.
" }}}

" Visual {{{
set cursorline                  " highlight current line

set nowrap                      " nowrap
set showcmd                     " show cmd
set showmatch                   " show matching brackets
set showbreak=↪                 " show '↪' if line is longer than screen
set mat=5                       " how many tenths of a second to blink matching brackets
set incsearch                   " show search matches as you type
set novisualbell                " no error bells
set noerrorbells                " no error bells
set title                       " sets the title
set wildmenu                    " show autocomplete options
set textwidth=79                " sets the text width
set tabpagemax=10 				" show 10 tabs

" highlight lines over 80 characters
highlight OverLength ctermbg=darkred ctermfg=white guibg=#AE0000
match OverLength /\%80v.\+/

if has("gui_running")
  set lines=999
  set columns=999
else
  if exists("+lines")
    set lines=40
  endif
  if exists("+columns")
    set columns=120
  endif
endif

" show color column
if exists('+colorcolumn')
  set colorcolumn=80
endif
" }}}

" Search {{{
set ignorecase                  " case insensitive search
set smartcase
set magic                       " enable advanced regular expressions
set hlsearch                    " enables highlighting search
" }}}

" Text {{{
set autoindent                  " use curr line's indent to set indent of new line
set smartindent                 " vim guesses indent level
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set gdefault					" the /g flag on :s substitutions by default
" }}}

" Folding {{{

set foldenable                  " enable folding
set foldmethod=marker
set foldlevel=0
set commentstring=\ #\ %s

nnoremap <Space> za             " space toggles folding
vnoremap <Space> za             " space toggles folding

function! CustomFoldText(spacer, ...) " {{{
    let spacer = a:spacer

    if exists("a:1")
        let max_num_cols = a:1
    else
        let max_num_cols = winwidth(0) - &fdc - 4
    endif

    " Skip empty lines"
    let first_line_start = v:foldstart
    while getline(first_line_start) =~ '^\s*$' | let first_line_start = nextnonblank(first_line_start + 1)
    endwhile

    if first_line_start > v:foldend
        let line = getline(v:foldstart)
    else
        let line = substitute(getline(first_line_start), '\t', repeat(' ', &tabstop), 'g')
    endif

    let num_folded_lines = v:foldend - v:foldstart
    let fold_percentage =  printf("%.1f", (num_folded_lines * 1.0) / line("$")* 100)

    let folded_line_display = num_folded_lines . " lines [" . fold_percentage . "%]"

    let spacer_fill = max_num_cols - strwidth(line) - strwidth(folded_line_display)
    return line . repeat(spacer, spacer_fill) . folded_line_display
endfunction " }}}
set foldtext=CustomFoldText('.',80)
" }}}

" Filetype {{{
filetype plugin indent on
autocmd BufNewFile,BufRead *.json set filetype=json
autocmd BufNewFile,BufRead *.vue set filetype=javascript
autocmd FileType css setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html,htmldjango,xhtml,haml setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 textwidth=0
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType yaml setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
" }}}

" Command Line {{{

" change working directory to that of file
cmap <Leader>cd lcd %:p:h

" bash like commands in command mode
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-k> <C-U>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
" }}}

" Keyboard Mapping {{{

" remap 0 to first word (going to the first col is kinda useless)
map 0 ^

" fix typos with e/w/q/a
" from: http://blog.sanctum.geek.nz/vim-command-typos/
if has("user_commands")
    command! -bang -nargs=* -complete=file E e<bang> <args>
    command! -bang -nargs=* -complete=file W w<bang> <args>
    command! -bang -nargs=* -complete=file Wq wq<bang> <args>
    command! -bang -nargs=* -complete=file WQ wq<bang> <args>
    command! -bang Wa wa<bang>
    command! -bang WA wa<bang>
    command! -bang Q q<bang>
    command! -bang QA qa<bang>
    command! -bang Qa qa<bang>
endif

" fix teh broken
nnoremap / /\v
vnoremap / /\v

" remap ESC in insert mode to jk - faster than jj?
inoremap jk <ESC>
inoremap kj <ESC>

" simplify window navigation with ctrl
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l
map <C-h> <C-W>h

" make Y act like C/D
nmap Y y$

" ; for : in normal/visual
nnoremap ; :
vnoremap ; :

" clear search matching across all buffers
noremap <Leader><space> :noh<CR>:call clearmatches()<CR>

" match braces using a tab
map <TAB> %

" <Leader>cd switches to directory of open buffer
map <Leader>cd :cd %:p:h<CR>

" <Leader>cf copies relative path to clipboard
nnoremap <Leader>cf :let @+=expand("%")<CR>

" <Leader>cf copies absolute path to clipboard
nnoremap <Leader>cF :let @+=expand("%:p")<CR>

" <Leader>D to make you smile
map <Leader>d :Nyan<CR>

" <Leader>dc to show diff of current buffer
map <Leader>dc :DiffChangesDiffToggle<CR>

" <Leader>dp to show patch of current buffer
map <Leader>dp :DiffChangesPatchToggle<CR>

" <Leader>f to start an Ack search
let g:ackprg = 'ag --nogroup --nocolor --column'
map <Leader>f :Ack<space>

" <Leader>h/l to go to previous/next in jumplist
nnoremap <Leader>h <C-O>
nnoremap <Leader>l <C-i>

" <Leader>G to create private Gist of entire buffer
map <Leader>G :Gist -p<CR>

" <Leader>n to toggle NerdTreeTabs
map <Leader>n <plug>NERDTreeTabsToggle<CR>
let NERDTreeShowHidden=1

" <Leader>num to toggle relative numbers
map <Leader>num :NumbersToggle<CR>

" <Leader>o to open bufExplorer
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
map <Leader>o :BufExplorerVerticalSplit<CR>

" ctrl-p shortcuts
set wildignore+=*.o,*.obj,.git,.svn,.hg,*.pyc
let g:ctrlp_map = '<Leader>p'
let g:ctrlp_cmd = 'CtrlPMixed'

" <Leader>pb to preview buffer with hammer.vim
map <Leader>pb :Hammer<CR>

" <Leader>sb to open scratch in horizontal split window
map <Leader>sb :Sscratch<CR>

" <Leader>Sb to open scratch in vertical split window
map <Leader>Sb :Vscratch<CR>

" CTags
map <Leader>tag :!ctags --extra=+f -R *<CR><CR>

" <Leader>tl to open Taglist project
map <Leader>tl :TlistToggle<CR>

" <Leader>u to toggle Gundo
nnoremap <Leader>u :GundoToggle<CR>

" <Leader>w to ZoomWin
map <Leader>w :ZoomWin<CR>

" <Leader>ws to clean trailing white space
map <Leader>ws :%s/\s\+$//e<CR>

" <Leader>x to show TODO list
map <Leader>x <Plug>TaskList

" <Leader>y to bring up YankRing
map <Leader>y :YRShow<CR>

" <Leader><Leader> to load up vim-easymotion
let g:EasyMotion_leader_key = '<Leader><Leader>'

" <F2> to toggle invisible characters
map <silent> <F2> :set invlist<CR>

" }}}

" Plugins {{{

" vim-template directory
let g:templates_directory="$HOME/.vim/templates"

" Snipmate snippets
let g:snippets_dir="$HOME/.vim/bundle/snipmate-snippets"

function! NyanMe() " {{{
    hi NyanFur             guifg=#BBBBBB
    hi NyanPoptartEdge     guifg=#ffd0ac
    hi NyanPoptartFrosting guifg=#fd3699 guibg=#fe98ff
    hi NyanRainbow1        guifg=#6831f8
    hi NyanRainbow2        guifg=#0099fc
    hi NyanRainbow3        guifg=#3cfa04
    hi NyanRainbow4        guifg=#fdfe00
    hi NyanRainbow5        guifg=#fc9d00
    hi NyanRainbow6        guifg=#fe0000

    echohl NyanRainbow1
    echon "≈"
    echohl NyanRainbow2
    echon "≋"
    echohl NyanRainbow3
    echon "≈"
    echohl NyanRainbow4
    echon "≋"
    echohl NyanRainbow5
    echon "≈"
    echohl NyanRainbow6
    echon "≋"
    echohl NyanRainbow1
    echon "≈"
    echohl NyanRainbow2
    echon "≋"
    echohl NyanRainbow3
    echon "≈"
    echohl NyanRainbow4
    echon "≋"
    echohl NyanRainbow5
    echon "≈"
    echohl NyanRainbow6
    echon "≋"
    echohl None
    echo ""

    echohl NyanRainbow1
    echon "≈"
    echohl NyanRainbow2
    echon "≋"
    echohl NyanRainbow3
    echon "≈"
    echohl NyanRainbow4
    echon "≋"
    echohl NyanRainbow5
    echon "≈"
    echohl NyanRainbow6
    echon "≋"
    echohl NyanRainbow1
    echon "≈"
    echohl NyanRainbow2
    echon "≋"
    echohl NyanRainbow3
    echon "≈"
    echohl NyanRainbow4
    echon "≋"
    echohl NyanRainbow5
    echon "≈"
    echohl NyanRainbow6
    echon "≋"
    echohl NyanFur
    echon "╰"
    echohl NyanPoptartEdge
    echon "⟨"
    echohl NyanPoptartFrosting
    echon "⣮⣯⡿"
    echohl NyanPoptartEdge
    echon "⟩"
    echohl NyanFur
    echon "⩾^ω^⩽"
    echohl None
    echo ""

    echohl NyanRainbow1
    echon "≈"
    echohl NyanRainbow2
    echon "≋"
    echohl NyanRainbow3
    echon "≈"
    echohl NyanRainbow4
    echon "≋"
    echohl NyanRainbow5
    echon "≈"
    echohl NyanRainbow6
    echon "≋"
    echohl NyanRainbow1
    echon "≈"
    echohl NyanRainbow2
    echon "≋"
    echohl NyanRainbow3
    echon "≈"
    echohl NyanRainbow4
    echon "≋"
    echohl NyanRainbow5
    echon "≈"
    echohl NyanRainbow6
    echon "≋"
    echohl None
    echon " "
    echohl NyanFur
    echon "”   ‟"
    echohl None

    sleep 1
    redraw
    echo " "
    echo " "
    echo "Noms?"
    redraw
endfunction " }}}
command! Nyan call NyanMe()

" allow pathogen to update runtime path
runtime! autoload/pathogen.vim
silent! call pathogen#helptags()
" }}}

" Platform Specific {{{
if has('win32') || has('win64')
  " Windows
elseif has('gui_macvim')
    " No gui for you!
    if has("gui_running")
        set guioptions=egmrt
    endif
endif
" }}}

" Code {{{
" improve commit messages
autocmd FileType gitcommit setlocal spell
autocmd FileType svn       setlocal spell
autocmd FileType asciidoc  setlocal spell

" highlights (and trims) whitespaces
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
autocmd FileType c,cpp,python,ruby,java autocmd BufWritePre <buffer> :call TrimWhiteSpace()
" }}}

" Shortcuts {{{
" Source: https://superuser.com/questions/555011/vim-close-all-tabs-to-the-right
function! TabCloseRight(bang)
    let cur=tabpagenr()
    while cur < tabpagenr('$')
        exe 'tabclose' . a:bang . ' ' . (cur + 1)
    endwhile
endfunction

function! TabCloseLeft(bang)
    while tabpagenr() > 1
        exe 'tabclose' . a:bang . ' 1'
    endwhile
endfunction

command! -bang TabCloseRight call TabCloseRight('<bang>')
command! -bang TabCloseLeft call TabCloseLeft('<bang>')
" }}}

" auto reload .vimrc {{{
augroup reload_vimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END
" }}}

" Source a local config to override stuffs {{{
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif
" }}}
