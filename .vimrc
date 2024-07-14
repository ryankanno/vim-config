"
" Ryan Kanno <ryankanno@gmail.com>
" @ryankanno
"

" vim-plug (d/l + install)
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
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'rhysd/devdocs.vim'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'mattn/emmet-vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'alok/notational-fzf-vim'
    Plug 'phanimahesh/goyo.vim'
    Plug 'haya14busa/is.vim'
    Plug 'cohama/lexima.vim'
    Plug 'junegunn/limelight.vim'
    Plug 'wfxr/minimap.vim', {'do': ':!cargo install --locked code-minimap'}
    Plug 'justinmk/molokai'
    Plug 'myusuf3/numbers.vim'
    Plug 'ethanmuller/scratch.vim'
    Plug 'majutsushi/tagbar'
    Plug 'wellle/targets.vim'
    Plug 'vim-scripts/TaskList.vim'
    Plug 'tpope/vim-abolish'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'Chiel92/vim-autoformat'
    Plug 'svermeulen/vim-cutlass'
    Plug 'ryanoasis/vim-devicons'
    Plug 'dodie/vim-disapprove-deep-indentation'
    Plug 'arecarn/vim-fold-cycle'
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'andymass/vim-matchup'
    Plug 'simnalamburt/vim-mundo'
    Plug 'junegunn/vim-plug'
    Plug 'tpope/vim-projectionist'
    Plug 'vimjas/vim-python-pep8-indent'
    Plug 'tpope/vim-repeat'
    Plug 'machakann/vim-sandwich'
    Plug 'tpope/vim-speeddating'
    Plug 'mhinz/vim-startify'
    Plug 'dstein64/vim-startuptime'
    Plug 'aperezdc/vim-template'
    Plug 'vim-test/vim-test'
    Plug 'tadaa/vimade'
    Plug 'vim-scripts/YankRing.vim'

    if has('nvim')
        Plug 'ray-x/lsp_signature.nvim'

        Plug 'williamboman/mason.nvim'
        Plug 'williamboman/mason-lspconfig.nvim'
        Plug 'neovim/nvim-lspconfig'

        Plug 'hrsh7th/cmp-nvim-lsp'
        Plug 'hrsh7th/cmp-buffer'
        Plug 'hrsh7th/cmp-cmdline'
        Plug 'hrsh7th/cmp-emoji'
        Plug 'hrsh7th/cmp-path'
        Plug 'lukas-reineke/cmp-rg'
        Plug 'ray-x/cmp-treesitter'
        Plug 'hrsh7th/nvim-cmp'

        Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.*', 'do': 'make install_jsregexp'}
        Plug 'saadparwaiz1/cmp_luasnip'
        Plug 'mireq/luasnip-snippets'

        Plug 'onsails/lspkind.nvim'
        Plug 'folke/trouble.nvim'

        Plug 'mfussenegger/nvim-dap'
        Plug 'nvim-neotest/nvim-nio'
        Plug 'rcarriga/nvim-dap-ui'

        Plug 'utilyre/barbecue.nvim'
        Plug 'smoka7/hop.nvim'
        Plug 'nvim-tree/nvim-tree.lua'
        Plug 'akinsho/toggleterm.nvim', {'tag' : 'v2.10.0'}
        Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

        Plug 'zbirenbaum/copilot.lua'
        Plug 'zbirenbaum/copilot-cmp'

        Plug 'echasnovski/mini.nvim'
        Plug 'SmiteshP/nvim-navic'
        Plug 'gennaro-tedesco/nvim-peekup'
    else
        Plug 'github/copilot.vim'
        Plug 'moll/vim-bbye'
        Plug 'tpope/vim-commentary'
        Plug 'itchyny/vim-cursorword'
        Plug 'matze/vim-move'
        Plug 'junegunn/vim-peekaboo'
        Plug 'sheerun/vim-polyglot'
    endif
endif

call plug#end()
" }}}

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

set lazyredraw                  " lazy
set ttyfast

set ruler                       " show ruler
set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)

set laststatus=2                " always show last status

set history=10000               " 10000 lines of history
set undolevels=10000            " 10000 levels of undo
set clipboard^=unnamed,unnamedplus " https://stackoverflow.com/questions/30691466/what-is-difference-between-vims-clipboard-unnamed-and-unnamedplus-settings
set ffs=unix,dos,mac            " set file format to unix, win, then old mac
set hidden                      " enable hidden files
set backspace=indent,eol,start  " enable backspace over indent, EOL, START

" create undo structures
if has('nvim')
    set undodir=$HOME/.nvim_undo
    if ! isdirectory(expand(&undodir))
        call mkdir(&undodir, 'p', 0700)
    endif
else
    set undodir=$HOME/.vim_undo
    if ! isdirectory(expand(&undodir))
        call mkdir(&undodir, 'p', 0700)
    endif
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

" Molokai
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

" Wildmenu {{{
if has('wildmenu')
    if ! has('nvim')
        set wildmode=list:longest
    endif
    set wildignorecase
    set wildignore+=.git,.hg,.svn,.bzr
    set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest,*.class,*.out,*.pyc,*.so,*.com,
    set wildignore+=*.swp,*.swo,*.swn,*.swm,*.tmp,*/tmp/*,.lock,*.DS_Store,._*
    set wildignore+=*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
    set wildignore+=*.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg
    set wildignore+=*.mp3,*.mp4,*.oga,*.ogg,*.wav,*.flac
    set wildignore+=*.eot,*.otf,*.ttf,*.woff
    set wildignore+=*.doc,*.pdf,*.cbr,*.cbz
    set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
    set wildignore+=*.jpg,*.png,*.jpeg,*.bmp,*.gif,*.tiff,*.svg,*.ico
    set wildignore+=*/node_modules/*
    set wildignore+=*.sqlite*
    set wildignore+=__pycache__,*.egg-info,.pytest_cache,.mypy_cache,.ruff_cache
    set wildignore+=*_rsa,*_rsa.*,*_dsa,*_dsa.*,*_keys,*.pem,*.key,*.gpg
    set wildignore+=*/.backup,*/.vim-backup,*/.nvim-backup
    set wildignore+=*/.swap,*/.vim-swap,*/.nvim-swap
    set wildignore+=*/.undo,*/.vim-undo,*/.nvim-undo
    set wildignore+=tags,.tags
endif
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
autocmd BufNewFile,BufRead *.jinja,*.jinja2,*.j2 set filetype=jinja
autocmd FileType css setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html,htmldjango,xhtml,haml,jinja setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 textwidth=0
autocmd FileType javascript,typescript,typescriptreact,javascriptreact setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType json setlocal fdm=syntax
autocmd FileType make setlocal noexpandtab
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType sass setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType yaml setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd Filetype crontab setlocal nobackup nowritebackup
" }}}

" Command Line {{{

" change working directory to that of file
cmap <Leader>cd lcd %:p:h<CR>:pwd<CR>

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

" clear search matching across all buffers
noremap <Leader><space> :noh<CR>:call clearmatches()<CR>

" match braces using a tab
map <TAB> %

" <Leader><Leader> to HopWord
map <Leader><Leader> :HopWord<CR>

" <Leader>_ to HopLineStart
map <Leader>_ :HopLineStart<CR>

" <Leader>B to open :Buffers
map <Leader>B :<C-u>Buffers<CR>

" <Leader>cc to comment
if has('nvim')
lua << EOF
    require('mini.comment').setup({
        mappings = {
            comment = '<Leader>c',
            comment_line = '<Leader>cc',
            comment_visual = '<Leader>c',
            text_object = '<Leader>c',
        }
    })
EOF
else
  nmap <Leader>cc <Plug>CommentaryLine
endif

" <Leader>cd switches to directory of open buffer
nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>

" <Leader>cf copies relative path to clipboard
nnoremap <Leader>cf :let @+=expand("%")<CR>

" <Leader>cF copies absolute path to clipboard
nnoremap <Leader>cF :let @+=expand("%:p")<CR>

" <Leader>dbb to toggle breakpoint
nnoremap <Leader>dbb :DapToggleBreakpoint<CR>

" <Leader>dbc to continue debugging
nnoremap <Leader>dbc :DapContinue<CR>

" <Leader>dbo to open DapUI
nnoremap <Leader>dbo :lua require("dapui").open()<CR>

" <Leader>f to start an `rg` search using FZF
map <Leader>f :Rg<space>

" <Leader>F to start a `Files` search using FZF
map <Leader>F :<C-u>Files<CR>

" <Leader>h/l to go to previous/next in jumplist
nnoremap <Leader>h <C-O>

nnoremap <Leader>l <C-i>

" <Leader>hn to HopNodes
map <Leader>hn :HopNodes<CR>

" Remap K to call devdocs in specific filetypes
let g:devdocs_filetype_map = {
            \ 'ruby': 'rails',
            \ 'typescriptreact': 'react',
            \ 'javascriptreact': 'react',
            \ 'javascript.test': 'jest',
            \ }
let g:devdocs_open_cmd = 'firefox'

augroup plugin-devdocs
    autocmd!
    autocmd FileType bash,c,cpp,go,rust,python nmap <buffer><leader>DD <Plug>(devdocs-under-cursor)
augroup END

" <Leader>nt to toggle NvimTreeToggle
map <Leader>nt :NvimTreeToggle<CR>

" <Leader>nf to reveal file in active buffer in NvimTree
map <Leader>nf :NvimTreeFindFile<CR>

" <Leader>num to toggle relative numbers
map <Leader>num :NumbersToggle<CR>
let g:numbers_exclude = ['goyo_pad', 'minibufexpl', 'nvim-tree', 'tagbar']

" ctrl-p shortcuts
let g:ctrlp_map = '<Leader>p'
let g:ctrlp_cmd = 'CtrlPMixed'

if executable('rg')
    set grepprg=rg\ --color=never
    let g:ctrlp_user_command = 'rg %s --files --hidden --color=never --glob ""'
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
nnoremap <Leader>u :MundoToggle<CR>
let g:mundo_prefer_python3 = 1
let g:mundo_right = 1

" <Leader>W to open :Windows
map <Leader>W :<C-u>Windows<CR>

" <Leader>ws to clean trailing white space
map <Leader>ws :%s/\s\+$//e<CR>

" <Leader>x to show TODO list
map <Leader>x <Plug>TaskList

" <Leader>y to bring up YankRing
map <Leader>y :YRShow<CR>
let g:yankring_window_height = 16
let g:yankring_max_history = 1024

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

" nvim-lsp
if has('nvim')
lua << EOF
    require("mason").setup({
      automatic_installation = true,
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    })

    require("mason-lspconfig").setup({
      ensure_installed = {
        "bashls",
        "clangd",
        "cssls",
        "dagger",
        "dockerls",
        "docker_compose_language_service",
        "elp",
        "gopls",
        "html",
        "htmx",
        "jinja_lsp",
        "jsonls",
        "lua_ls",
        "marksman",
        "nil_ls",
        "pyright",
        "ruff_lsp",
        "rust_analyzer",
        "tailwindcss",
        "taplo",
        "tsserver",
        "zls"
      }
    })

    local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

    require'mason-lspconfig'.setup_handlers{
      function (server_name) -- default handler (optional)
        require'lspconfig'[server_name].setup{capabilities = lsp_capabilities}
      end,

      -- https://github.com/astral-sh/ruff-lsp/issues/384
      ['pyright'] = function()
        require'lspconfig'.pyright.setup{
          settings = {
            pyright = {
              disableOrganizeImports = true,
              disableTaggedHints = true,
            },
            python = {
              analysis = {
                diagnosticMode = "off",
                diagnosticSeverityOverrides = {
                  -- https://github.com/microsoft/pyright/blob/main/docs/configuration.md#type-check-diagnostics-settings
                  reportUndefinedVariable = "none",
                },
              }
            }
          }
        }
      end,
    }

    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, { desc = 'diagnostic.open_float' })
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'diagnostic.goto_prev' })
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'diagnostic.goto_next' })
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, { desc = 'diagnostic.setloclist' })

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        local function buf_set_keymap(key, func, desc, ...)
          local rest = { ... }
          local need_xmap = rest[1]
          local mode = need_xmap and { 'n', 'x' } or 'n'
          local opts = { buffer = ev.buf, desc = 'lsp.' .. desc }
          vim.keymap.set(mode, key, func, opts)
        end

        buf_set_keymap('gD', vim.lsp.buf.declaration, 'declaration')
        buf_set_keymap('gd', vim.lsp.buf.definition, 'definition')
        buf_set_keymap('gi', vim.lsp.buf.implementation, 'implementation')
        buf_set_keymap('<C-k>', vim.lsp.buf.signature_help, 'signature_help')
        buf_set_keymap('K', vim.lsp.buf.hover, 'hover')

        buf_set_keymap('<SPACE>wa', vim.lsp.buf.add_workspace_folder, 'add_workspace_folder')
        buf_set_keymap('<SPACE>wr', vim.lsp.buf.remove_workspace_folder, 'remove_workspace_folder')
        buf_set_keymap('<SPACE>wl', function() vim.print(vim.lsp.buf.list_workspace_folders()) end, 'list_workspace_folders')

        buf_set_keymap('<SPACE>D', vim.lsp.buf.type_definition, 'type_definition')
        buf_set_keymap('<SPACE>rn', vim.lsp.buf.rename, 'rename')
        buf_set_keymap('<SPACE>ca', vim.lsp.buf.code_action, 'code_action', true)
        buf_set_keymap('gr', vim.lsp.buf.references, 'references')
        buf_set_keymap('<SPACE>f', function() vim.lsp.buf.format { async = true } end, 'format', true)

        if vim.lsp.get_clients == nil then
          vim.lsp.get_clients = vim.lsp.get_active_clients
        end

        for _, client in pairs(vim.lsp.get_clients()) do
          if client.name == "tailwindcss" then
            client.server_capabilities.completionProvider.triggerCharacters = { '"', "'", "`", ".", "(", "[", "!", "/", ":" }
          end
        end

      end,
    })
EOF
endif

" luasnip / cmp
if has('nvim')
lua << EOF

    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    require('luasnip_snippets.common.snip_utils').setup()

    local luasnip = require 'luasnip'
    luasnip.setup({
      load_ft_func = require('luasnip_snippets.common.snip_utils').load_ft_func,
      ft_func = require('luasnip_snippets.common.snip_utils').ft_func,
      enable_autosnippets = true,
      -- Uncomment to enable visual snippets triggered using <c-x>
      -- store_selection_keys = '<c-x>',
    })

    local lspkind = require('lspkind')
    local cmp = require('cmp')
    cmp.setup {
      formatting = {
        format = lspkind.cmp_format({
          mode = "symbol_text",
          menu = ({
            copilot = "[Copilot]",
            treesitter = "[Tree]",
            buffer = "[Buffer]",
            nvim_lsp = "[LSP]",
            luasnip = "[LuaSnip]",
            path = "[Path]",
            emoji = "[Emoji]",
            rg = "[RipGrep]",
          })
        }),
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      }),
      sources = cmp.config.sources({
        { name = 'copilot', group_index = 2 },
        { name = 'treesitter', group_index = 2 },
        { name = 'nvim_lsp', group_index = 2 },
        { name = 'luasnip', group_index = 2 },
        { name = 'buffer', group_index = 2 },
        { name = 'path', group_index = 2 },
        { name = 'emoji', group_index = 2 },
        { name = 'rg', group_index = 2 },
      }),
    }

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources(
      {
        { name = 'path' }
      },
      {
        {
          name = 'cmdline',
          option = {
            ignore_cmds = { 'Man', '!' }
          }
        }
      })
    })
EOF
endif

" luasnip
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>
snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>
imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'

" cmp - https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance#how-to-add-visual-studio-code-dark-theme-colors-to-the-menu
highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
highlight! link CmpItemAbbrMatchFuzzy CmpItemAbbrMatch
highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
highlight! link CmpItemKindInterface CmpItemKindVariable
highlight! link CmpItemKindText CmpItemKindVariable
highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
highlight! link CmpItemKindMethod CmpItemKindFunction
highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
highlight! link CmpItemKindProperty CmpItemKindKeyword
highlight! link CmpItemKindUnit CmpItemKindKeyword

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
    require('hop').setup({
        quit_key = '<SPC>',
    })

    local hop = require('hop')
    local directions = require('hop.hint').HintDirection

    vim.keymap.set('', 'f', function()
      hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
    end, {remap=true})

    vim.keymap.set('', 'F', function()
      hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
    end, {remap=true})

    vim.keymap.set('', 't', function()
      hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
    end, {remap=true})

    vim.keymap.set('', 'T', function()
      hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
    end, {remap=true})
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
    let g:gutentags_ctags_executable = '/usr/bin/ctags'
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

" vim-move / mini.move
if has('nvim')
lua << EOF
    require('mini.move').setup()
EOF
else
let g:move_key_modifier = 'A'
endif

" mini.nvim
if has('nvim')
lua << EOF
    require('mini.bufremove').setup()
    vim.keymap.set('n', '<leader>Bd', function()
      MiniBufremove.delete()
    end, { desc = "buffer delete" })
    vim.keymap.set('n', '<leader>Bw', function()
      MiniBufremove.wipeout()
    end, { desc = "buffer wipeout" })

    require('mini.cursorword').setup()
EOF
endif

" toggleterm.nvim
if has('nvim')
lua << EOF
    require("toggleterm").setup({
        open_mapping = [[<leader>T]],
        size = function(term)
            if term.direction == "horizontal" then return 15
            elseif term.direction == "vertical" then return vim.o.columns * 0.4
            end
        end,
        close_on_exit = false,
        direction = 'horizontal',
    })
EOF

tmap <C-h> <C-\><C-N><C-h>
tmap <C-l> <C-\><C-N><C-l>
tmap <C-j> <C-\><C-N><C-j>
tmap <C-k> <C-\><C-N><C-k>

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
        },
        indent = {
            enable = true,
            disable = { "yaml", "python" }
        }
    })
EOF
endif

" trouble
if has('nvim')
lua << EOF
    require("trouble").setup({})
EOF

nnoremap <silent> <leader>xx <cmd>Trouble diagnostics toggle<CR>
nnoremap <silent> <leader>xX <cmd>Trouble diagnostics toggle filter.buf=0<CR>
nnoremap <silent> <leader>cs <cmd>Trouble symbols toggle focus=false<CR>
nnoremap <silent> <leader>cl <cmd>Trouble lsp toggle focus=false win.position=right<CR>
nnoremap <silent> <leader>cls <cmd>Trouble lsp_document_symbols toggle focus=false win.position=right<CR>
nnoremap <silent> <leader>xL <cmd>Trouble loclist toggle<CR>
nnoremap <silent> <leader>xQ <cmd>Trouble qflist toggle<CR>
endif

" vim-test
let test#strategy = "toggleterm"
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tc :TestClass<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ta :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tlv :TestVisit<CR>

" copilot.lua
if has('nvim')
lua << EOF
    require('copilot').setup({
      panel = {
        enabled = false,
        auto_refresh = true,
      },
      suggestion = {
        enabled = false,
        auto_trigger = true,
        debounce = 75,
      },
      copilot_node_command = 'node', -- Node.js version must be > 16.x
      server_opts_overrides = {},
    })

    require('copilot_cmp').setup {}
EOF
endif

" vim-airline
let g:airline_theme='base16_monokai'

" lsp_signature
if has('nvim')
lua << EOF
    require'lsp_signature'.setup({})
EOF
endif

" vim-gitgutter
command! -nargs=0 OpenGitGutterQuickFix GitGutterQuickFix | exe "norm mQ" | copen

nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
nmap <leader>hp <Plug>(GitGutterPreviewHunk)
nmap <leader>hs <Plug>(GitGutterStageHunk)
nmap <leader>hu <Plug>(GitGutterUndoHunk)
nnoremap <silent> <leader>hf :GitGutterFold<CR>
nnoremap <silent> <leader>hq :OpenGitGutterQuickFix<CR>

" barbecue.nvim
if has('nvim')
lua << EOF
    vim.opt.updatetime = 200
    require("barbecue").setup({
      create_autocmd = false,
    })

    vim.api.nvim_create_autocmd({
      "WinResized",
      "BufWinEnter",
      "CursorHold",
      "InsertLeave",
      "BufModifiedSet",
    }, {
      group = vim.api.nvim_create_augroup("barbecue.updater", {}),
      callback = function()
        require("barbecue.ui").update()
      end,
    })
EOF
endif

" vim-sandwich
let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
xmap is <Plug>(textobj-sandwich-query-i)
xmap as <Plug>(textobj-sandwich-query-a)
omap is <Plug>(textobj-sandwich-query-i)
omap as <Plug>(textobj-sandwich-query-a)
xmap iss <Plug>(textobj-sandwich-auto-i)
xmap ass <Plug>(textobj-sandwich-auto-a)
omap iss <Plug>(textobj-sandwich-auto-i)
omap ass <Plug>(textobj-sandwich-auto-a)
xmap im <Plug>(textobj-sandwich-literal-query-i)
xmap am <Plug>(textobj-sandwich-literal-query-a)
omap im <Plug>(textobj-sandwich-literal-query-i)
omap am <Plug>(textobj-sandwich-literal-query-a)

" nvim.peekup
let g:peekup_open = '<leader>"'
let g:peekup_paste_before = '<leader>"P'
let g:peekup_paste_after = '<leader>"p'

" editorconfig-vim
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
au FileType gitcommit let b:EditorConfig_disable = 1

" nvim-dap / nvim-dap-ui
if has('nvim')
lua << EOF
  local dap = require('dap')

  dap.adapters.python = function(cb, config)
    if config.request == 'attach' then
      ---@diagnostic disable-next-line: undefined-field
      local port = (config.connect or config).port
      ---@diagnostic disable-next-line: undefined-field
      local host = (config.connect or config).host or '127.0.0.1'
      cb({
        type = 'server',
        port = assert(port, '`connect.port` is required for a python `attach` configuration'),
        host = host,
        options = {
          source_filetype = 'python',
        },
      })
    else
      cb({
        type = 'executable',
        command = os.getenv("HOME") .. "/.anyenv/envs/pyenv/versions/3.11.0/bin/python",
        args = { '-m', 'debugpy.adapter' },
        options = {
          source_filetype = 'python',
        },
      })
    end
  end

  dap.configurations.python = {
    {
      type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
      request = 'launch';
      name = "Launch file";
      -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options
      program = "${file}"; -- This configuration will launch the current file if used.
      pythonPath = function()
        -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
        -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
        -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
        return os.getenv("VIRTUAL_ENV") .. "/bin/python"
      end;
    },
  }

  local dapui = require("dapui")
  dapui.setup()

  dap.listeners.before.attach.dapui_config = function()
    dapui.open()
  end
  dap.listeners.before.launch.dapui_config = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
  end
  dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
  end
EOF
endif

" mini.clue
if has('nvim')
lua << EOF
    require('mini.clue').setup({
      window = {
        config = {
          anchor = "SW",
          width = math.floor(0.618 * vim.o.columns),
          row = "auto",
          col = "auto",
        },
      },
      triggers = {
        -- Leader triggers
        { mode = "n", keys = "<Leader>" },
        { mode = "x", keys = "<Leader>" },

        -- Built-in completion
        { mode = "i", keys = "<C-x>" },

        -- `g` key
        { mode = "n", keys = "g" },
        { mode = "x", keys = "g" },

	    -- Marks
        { mode = "n", keys = "'" },
        { mode = "n", keys = "`" },
        { mode = "x", keys = "'" },
        { mode = "x", keys = "`" },

	    -- Registers
        { mode = "n", keys = '"' },
        { mode = "x", keys = '"' },
        { mode = "i", keys = "<C-r>" },
        { mode = "c", keys = "<C-r>" },

	    -- Window commands
        { mode = "n", keys = "<C-w>" },

        -- `z` key
        { mode = "n", keys = "z" },
        { mode = "x", keys = "z" },

        -- `space` key
        { mode = "n", keys = "<SPACE>" },
        { mode = "x", keys = "<SPACE>" },

        -- `s` key
        { mode = "n", keys = "s" },
        { mode = "x", keys = "s" },

        -- `i` key
        { mode = "x", keys = "i" },
      },
      clues = {
        -- Enhance this by adding descriptions for <Leader> mapping groups
        require("mini.clue").gen_clues.builtin_completion(),
        require("mini.clue").gen_clues.g(),
        require("mini.clue").gen_clues.marks(),
        require("mini.clue").gen_clues.registers(),
        require("mini.clue").gen_clues.windows(),
        require("mini.clue").gen_clues.z(),
        { mode = "n", keys = "<leader>t", desc = "+tests" },
        { mode = "n", keys = "<leader>db", desc = "+dap" },
      },
    })

    miniclue = require('mini.clue')

    miniclue.set_mapping_desc('n', '<leader><leader>', 'hop word')
    miniclue.set_mapping_desc('n', '<leader>_', 'hop line start')
    miniclue.set_mapping_desc('n', '<leader>B', 'fzf buffer search')
    miniclue.set_mapping_desc('n', '<leader>cs', 'toggle symbols (Trouble)')
    miniclue.set_mapping_desc('n', '<leader>cl', 'toggle lsp (Trouble)')
    miniclue.set_mapping_desc('n', '<leader>cls', 'toggle lsp symbols (Trouble)')
    miniclue.set_mapping_desc('n', '<leader>dbb', 'toggle breakpoint')
    miniclue.set_mapping_desc('n', '<leader>dbc', 'continue')
    miniclue.set_mapping_desc('n', '<leader>dbo', 'open dapui')
    miniclue.set_mapping_desc('n', '<leader>F', 'fzf files search')
    miniclue.set_mapping_desc('n', '<leader>f', 'fzf ripgrep search')
    miniclue.set_mapping_desc('n', '<leader>h', 'previous jumplist position')
    miniclue.set_mapping_desc('n', '<leader>hf', 'git fold')
    miniclue.set_mapping_desc('n', '<leader>hs', 'stage git hunk')
    miniclue.set_mapping_desc('n', '<leader>hp', 'preview git hunk')
    miniclue.set_mapping_desc('n', '<leader>hq', 'git quick fix')
    miniclue.set_mapping_desc('n', '<leader>hu', 'undo git hunk')
    miniclue.set_mapping_desc('n', '<leader>l', 'next jumplist position')
    miniclue.set_mapping_desc('n', '<leader>nt', 'toggle NvimTree')
    miniclue.set_mapping_desc('n', '<leader>nf', 'reveal file in NvimTree')
    miniclue.set_mapping_desc('n', '<leader>num', 'toggle relative line numbers')
    miniclue.set_mapping_desc('n', '<leader>s', 'open horizontal scratch')
    miniclue.set_mapping_desc('n', '<leader>S', 'open vertical scratch')
    miniclue.set_mapping_desc('n', '<leader>tb', 'toggle Tagbar')
    miniclue.set_mapping_desc('n', '<leader>ta', 'runs whole test suite')
    miniclue.set_mapping_desc('n', '<leader>tc', 'runs nearest test class')
    miniclue.set_mapping_desc('n', '<leader>tf', 'runs all tests in file')
    miniclue.set_mapping_desc('n', '<leader>tl', 'runs last test')
    miniclue.set_mapping_desc('n', '<leader>tlv', 'visit last test file')
    miniclue.set_mapping_desc('n', '<leader>tn', 'runs test nearest to cursor')
    miniclue.set_mapping_desc('n', '<leader>u', 'toggle Mundo')
    miniclue.set_mapping_desc('n', '<leader>W', 'fzf windows search')
    miniclue.set_mapping_desc('n', '<leader>x', 'toggle TaskList')
    miniclue.set_mapping_desc('n', '<leader>xx', 'toggle diagnostics (Trouble)')
    miniclue.set_mapping_desc('n', '<leader>xX', 'toggle current buffer diagnostics (Trouble)')
    miniclue.set_mapping_desc('n', '<leader>xL', 'toggle location list (Trouble)')
    miniclue.set_mapping_desc('n', '<leader>xQ', 'toggle quick fix list (Trouble)')
    miniclue.set_mapping_desc('n', '<leader>y', 'toggle YankRing')
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

function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <leader>z :ZoomToggle<CR>

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
