"
" Ryan Kanno <ryankanno@gmail.com>
" @ryankanno
"

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let g:user="Ryan Kanno"
let g:email="ryankanno@localkinegrinds.com"

let s:uname = substitute(system("uname -s"), '\n', '', '')

" Plugins {{{

call plug#begin()

if !exists('g:vscode')
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'alok/notational-fzf-vim'
    Plug 'dense-analysis/ale'
    Plug 'github/copilot.vim'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'rhysd/devdocs.vim'
    Plug 'mattn/emmet-vim'
    Plug 'phanimahesh/goyo.vim'
    Plug 'haya14busa/is.vim'
    Plug 'cohama/lexima.vim'
    Plug 'junegunn/limelight.vim'
    Plug 'myusuf3/numbers.vim'
    Plug 'ethanmuller/scratch.vim'
    Plug 'tweekmonster/startuptime.vim'
    Plug 'ervandew/supertab'
    Plug 'majutsushi/tagbar'
    Plug 'wellle/targets.vim'
    Plug 'vim-scripts/TaskList.vim'
    Plug 'SirVer/ultisnips'
    Plug 'tpope/vim-abolish'
    Plug 'Chiel92/vim-autoformat'
    Plug 'moll/vim-bbye'
    Plug 'tpope/vim-commentary'
    Plug 'itchyny/vim-cursorword'
    Plug 'svermeulen/vim-cutlass'
    Plug 'ryanoasis/vim-devicons'
    Plug 'jmcantrell/vim-diffchanges'
    Plug 'dodie/vim-disapprove-deep-indentation'
    Plug 'arecarn/vim-fold-cycle'
    Plug 'tpope/vim-fugitive'
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'andymass/vim-matchup'
    Plug 'matze/vim-move'
    Plug 'simnalamburt/vim-mundo'
    Plug 'osyo-manga/vim-over'
    Plug 'junegunn/vim-peekaboo'
    Plug 'junegunn/vim-plug'
    Plug 'sheerun/vim-polyglot'
    Plug 'Lokaltog/vim-powerline'
    Plug 'tpope/vim-repeat'
    Plug 'sunaku/vim-shortcut'
    Plug 'honza/vim-snippets'
    Plug 'tpope/vim-speeddating'
    Plug 'mhinz/vim-startify'
    Plug 'tpope/vim-surround'
    Plug 'aperezdc/vim-template'
    Plug 'tadaa/vimade'
    Plug 'vim-scripts/YankRing.vim'
    Plug 'regedarek/ZoomWin'
    if has('nvim')
        Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
        Plug 'phaazon/hop.nvim'
        Plug 'nvim-tree/nvim-tree.lua'
        Plug 'akinsho/toggleterm.nvim', {'tag' : 'v2.10.0'}
        Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    endif
endif

call plug#end()
" }}}

" Abbreviations {{{
iab me@ Ryan Kanno <ryankanno@localkinegrinds.com>
iab date@ <C-R>=strftime("%A, %B %e %Y %I:%M:%S %p %Z")<CR>
" }}}

" Hack until I refactor some of this, but need to call this early.
runtime plugin/shortcut.vim

" General {{{
let mapleader=","               " set mapleader
set nocompatible                " disable older vi compatibility
set modeline                    " respect other
set encoding=utf-8              " use utf-8 encoding

set number                      " set line numbers

set lazyredraw                  " lazy
set ttyfast

set ruler                       " show ruler
set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)

set laststatus=2                " always show last status

set history=10000               " 1000 lines of history
set undolevels=10000            " 1000 levels of undo
set clipboard+=unnamed          " share clipboard with win
set ffs=unix,dos,mac            " set file format to unix, win, then old mac
set hidden                      " enable hidden files
set backspace=indent,eol,start  " enable backspace over indent, EOL, START

" create undo structures
set undodir=$HOME/.vim_undo
if ! isdirectory(expand(&undodir))
    call mkdir(&undodir, 'p', 0700)
endif
set undofile

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
set synmaxcol=256

set termguicolors               " sets colors
set background=dark             " sets the background color (I like it dark)
colorscheme molokai            " <3 colorscheme ftw.
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

" show color column
if exists('+colorcolumn')
    set colorcolumn=80
endif
" }}}

" Neovim {{{
if has('nvim')
    let g:loaded_python_provider=0
endif
" }}}
"
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
autocmd BufNewFile,BufRead *.scss,*.sass set filetype=sass
autocmd BufNewFile,BufRead *.ts set filetype=typescript
autocmd BufNewFile,BufRead *.tsx set filetype=typescriptreact
autocmd BufNewFile,BufRead *.jsx set filetype=javascriptreact
autocmd BufNewFile,BufRead *.vue set filetype=javascript
autocmd FileType css setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html,htmldjango,xhtml,haml setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 textwidth=0
autocmd FileType javascript,typescript,typescriptreact,javascriptreact setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType json setlocal fdm=syntax
autocmd FileType make setlocal noexpandtab
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType sass setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType yaml setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd filetype crontab setlocal nobackup nowritebackup
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
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" make Y act like C/D
nmap Y y$

" ; for : in normal/visual
nnoremap ; :
vnoremap ; :

" set partial entry to run the shortcuts menu
noremap <silent> <Leader> :Shortcuts<Return>

" clear search matching across all buffers
noremap <Leader><space> :noh<CR>:call clearmatches()<CR>

" match braces using a tab
map <TAB> %

" <Leader><Leader> to HopWord
map <Leader><Leader> :HopWord<CR>

" <Leader>_ to HopLineStart
map <Leader>_ :HopLineStart<CR>

" <Leader>b to open :Buffers
map <Leader>b :Buffers<CR>

" <Leader>cc to comment
Shortcut comment out line
            \ nmap <Leader>cc <Plug>CommentaryLine

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

" <Leader>f to start an `rg` search using FZF
Shortcut start a FZF rg search
            \ map <Leader>f :Rg<space>

" <Leader>F to start a `Files` search using FZF
Shortcut start a FZF files search
            \ map <Leader>F :Files<CR>

" <Leader>h/l to go to previous/next in jumplist
Shortcut previous jumplist position
            \ nnoremap <Leader>h <C-O>
Shortcut next jumplist position
            \ nnoremap <Leader>l <C-i>

" Remap K to call devdocs in specific filetypes
let g:devdocs_filetype_map = {
            \ 'ruby': 'rails',
            \ 'typescriptreact': 'react',
            \ 'javascriptreact': 'react',
            \ 'javascript.test': 'jest',
            \ }

augroup plugin-devdocs
    autocmd!
    autocmd FileType bash,c,cpp,go,rust,python nmap <buffer>K <Plug>(devdocs-under-cursor)
augroup END

" <Leader>n to focus NvimTree
map <Leader>n :NvimTreeFocus<CR>

" <Leader>nt to toggle NvimTreeToggle
map <Leader>nt :NvimTreeToggle<CR>

" <Leader>ntf to reveal file in active buffer in NvimTree
map <Leader>ntf :NvimTreeFindFile<CR>

" <Leader>num to toggle relative numbers
map <Leader>num :NumbersToggle<CR>
let g:numbers_exclude = ['goyo_pad', 'gundo', 'minibufexpl', 'nvim-tree', 'tagbar']

" <Leader>o for OverCommandLine
map <Leader>o :OverCommandLine<CR>

" ctrl-p shortcuts
set wildignore+=*/.svn/*,*/.hg/*,*/.git/*,*/tmp/*,*.swp,*.o,*.obj,*.pyc
let g:ctrlp_map = '<Leader>p'
let g:ctrlp_cmd = 'CtrlPMixed'

if executable('rg')
    set grepprg=rg\ --color=never
    let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
    let g:ctrlp_use_caching = 0
endif

" <Leader>s to open scratch in horizontal split window
map <Leader>s :Sscratch<CR>

" <Leader>S to open scratch in vertical split window
map <Leader>S :Vscratch<CR>

" CTags
set tags+=./tags;/
map <Leader>tag :!uctags --extra=+f -R *<CR><CR>
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <D-]> :vsplit <CR>:exec("tag ".expand("<cword>"))<CR>

" <Leader>tb to open Tagbar
map <Leader>tb :TagbarToggle<CR>
let g:tagbar_type_javascript = {
            \ 'ctagstype': 'javascript',
            \ 'kinds': [
                \ 'A:arrays',
                \ 'P:properties',
                \ 'T:tags',
                \ 'O:objects',
                \ 'G:generator functions',
                \ 'F:functions',
                \ 'C:constructors/classes',
                \ 'M:methods',
                \ 'V:variables',
                \ 'I:imports',
                \ 'E:exports',
                \ 'S:styled components'
                \ ]}

" <Leader>u to toggle Mundo
let g:mundo_prefer_python3 = 1
let g:mundo_right = 1
nnoremap <Leader>u :MundoToggle<CR>

" <Leader>w to ZoomWin
map <Leader>w :ZoomWin<CR>

" <Leader>ws to clean trailing white space
map <Leader>ws :%s/\s\+$//e<CR>

" <Leader>x to show TODO list
map <Leader>x <Plug>TaskList

" <Leader>y to bring up YankRing
let g:yankring_window_height = 16
let g:yankring_max_history = 1024
map <Leader>y :YRShow<CR>

" <F2> to toggle invisible characters
map <silent> <F2> :set invlist<CR>

" <F3> to toggle Autoformat
noremap <F3> :Autoformat<CR>

" }}}

" Plugins {{{

" vim-cutlass
nnoremap x d
xnoremap x d

nnoremap xx dd
nnoremap X D

" ale
noremap <Leader>af :ALEFix<CR>

let g:ale_linters = {
            \ 'javascript': ['eslint'],
            \ 'python': [],
            \ 'typescript': ['eslint', 'tsserver'],
            \ 'typescriptreact': ['eslint', 'tsserver'],
            \ }
let g:ale_fixers = {
            \ 'javascript': ['eslint'],
            \ 'javascriptreact': ['eslint'],
            \ 'typescript': ['eslint'],
            \ 'typescriptreact': ['eslint'],
            \ 'scss': ['prettier'],
            \ 'html': ['prettier'],
            \ }
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters_explicit = 1
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1

let g:ale_javascript_eslint_executable='npx eslint'

" coc.nvim
if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" fzf.vim
set rtp+=~/.fzf
command! -bang -nargs=* Rg
            \ call fzf#vim#grep(
            \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
            \   <bang>0 ? fzf#vim#with_preview('up:50%')
            \           : fzf#vim#with_preview('right:50%', '?'),
            \   <bang>0)

" hop.nvim
if has('nvim')
lua << EOF
    require'hop'.setup{
        quit_key = '<SPC>',
    }
EOF
endif

" nvim-tree.lua
if has('nvim')
lua << EOF
    local function open_nvim_tree(data)
      -- buffer is a real file on the disk
      local real_file = vim.fn.filereadable(data.file) == 1

      -- buffer is a [No Name]
      local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

      -- only files please
      if not real_file and not no_name then
        return
      end

      -- open the tree but don't focus it
      require("nvim-tree.api").tree.toggle({ focus = false })
    end

    vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

    require'nvim-tree'.setup{
        open_on_tab = true,
        auto_reload_on_write = true,
        update_focused_file = {
            enable = true
        },
        diagnostics = {
            enable = false,
        },
        actions = {
            open_file = {
                quit_on_open = false,
            }
        }
    }
EOF
endif

" notational-fzf-vim
let g:nv_search_paths = ['~/.notes/']

" vim-gutentags
if s:uname == "Darwin"
    let g:gutentags_ctags_executable = '/opt/local/bin/uctags'
elseif s:uname == "Linux"
    let g:gutentags_ctags_executable = '/snap/bin/ctags'
endif
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root  = ['package.json', '.git']
let g:gutentags_cache_dir = expand('~/.gutentags_cache')
let g:gutentags_exclude_filetypes = ['gitcommit', 'gitconfig', 'gitrebase', 'gitsendemail', 'git']
let g:gutentags_trace = 1
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0
let g:gutentags_ctags_extra_args = ['--tag-relative=yes', '--fields=+ailmnS']

if executable('rg')
    let g:gutentags_file_list_command = 'rg --files'
else
    let g:gutentags_file_list_command = {
                \ 'markers': {
                \ '.git': 'bash -c "git ls-files; git ls-files --others --exclude-standard"',
                \ },
                \ }
endif

let g:gutentags_ctags_exclude = [
            \  '*.git', 'cache', 'build', 'dist', 'bin', 'node_modules',
            \  '*.pyc', '.tox', '.mypy_cache',
            \  '.DS_Store',
            \  '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png', '*.svg',
            \  '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
            \  '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx', '*.xls',
            \  ]

" vim-template directory
let g:templates_directory="$HOME/.vim/templates"

" vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1

" vim-move
let g:move_key_modifier = 'C'

" vim-bbye
nnoremap <Leader>q :Bdelete<CR>

" toggleterm.nvim
if has('nvim')
lua << EOF
    require("toggleterm").setup({
        open_mapping = [[<leader>t]],
        size = function(term)
            if term.direction == "horizontal" then return 15
            elseif term.direction == "vertical" then return vim.o.columns * 0.4
            end
        end,
        close_on_exit = false,
        direction = 'horizontal',
    })
EOF
nnoremap <leader>t :ToggleTerm <CR>
nnoremap <leader>T :ToggleTermToggleAll <CR>
endif

" treesitter
if has('nvim')
lua << EOF
    require("nvim-treesitter.configs").setup({
        ensure_installed = "all",
        sync_install = false,
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false
        }
    })
EOF
endif

" goyo + limelight
autocmd BufLeave goyo_pad setlocal norelativenumber
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

function! s:goyo_enter()
    if has('gui_running')
        set fullscreen
    endif
    set nu!
    set rnu!
    NumbersDisable
    Limelight
endfunction

function! s:goyo_leave()
    if has('gui_running')
        set nofullscreen
    endif
    set nu
    set rnu
    NumbersEnable
    Limelight!
endfunction

function! NyanMe()
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
endfunction
command! Nyan call NyanMe()
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

function! OnlyNerdTree()
    let curr_win_id = win_getid()
    windo if win_getid() != curr_win_id && &filetype != 'nerdtree' | close | endif
endfunction

command! -bang CloseAll call OnlyNerdTree()
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
