# My .vim configuration

**Here be dragons.**

I periodically walk my configuration file and fix things that aren't working 
for me and/or try to better optimize my development environment.  As humans, 
we're generally terrible about it since we're resistant to change.  If that 
doesn't suit you, you've been warned.  On the flip, if this does suit you, 
it means you'll have an amazing dev editing environment.

## Quick Setup

### Install

curl -L -o - https://raw.github.com/ryankanno/vim-config/main/install.sh | bash

**Note** If you already have this installed, the installation script will
instead just pull instead of update.

### Uninstall

Just pass "UNINSTALL" to the install.sh script.


## Shortcuts

<table>
    <thead>
        <tr>
            <th>Shortcut</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>jk/kj</td>
            <td>ESC in insert mode</td>
        </tr>
        <tr>
            <td>;</td>
            <td>:</td>
        </tr>
        <tr>
            <td>&lt;TAB&gt;</td>
            <td>%</td>
        </tr>
        <tr>
            <td>dc</td>
            <td>Diff of current buffer</td>
        </tr>
        <tr>
            <td>dp</td>
            <td>Patch of current buffer</td>
        </tr>
        <tr>
            <td>K</td>
            <td>Open https://devdocs.io using word under cursor</td>
        </tr>
        <tr>
            <td>&lt;Leader&gt;b</td>
            <td>Start a `:Buffers` search using FZF</td>
        </tr>
        <tr>
            <td>&lt;Leader&gt;f</td>
            <td>Start a `:Rg` search using FZF</td>
        </tr>
        <tr>
            <td>&lt;Leader&gt;F</td>
            <td>Start a `:Files` search using FZF</td>
        </tr>
        <tr>
            <td>&lt;Leader&gt;h/l</td>
            <td>Next/prev in jumplist</td>
        </tr>
        <tr>
            <td>&lt;Leader&gt;nt</td>
            <td>Toggle NvimTree</td>
        </tr>
        <tr>
            <td>&lt;Leader&gt;nf</td>
            <td>Reveal active buffer in NvimTree</td>
        </tr>
        <tr>
            <td>&lt;Leader&gt;num</td>
            <td>Toggle Numbers.vim (relative/absolute)</td>
        </tr>
        <tr>
            <td>&lt;Leader&gt;o</td>
            <td>Toggle OverCommandLine</td>
        </tr>
        <tr>
            <td>&lt;Leader&gt;p</td>
            <td>Ctrl-P</td>
        </tr>
        <tr>
            <td>&lt;Leader&gt;(s/S)</td>
            <td>Open scratch buffer in split window</td>
        </tr>
        <tr>
            <td>&lt;Leader&gt;t</td>
            <td>Toggle terminal (nvim)</td>
        </tr>
        <tr>
            <td>&lt;Leader&gt;T</td>
            <td>Toggle terminal all (nvim)</td>
        </tr>
        <tr>
            <td>&lt;Leader&gt;tag</td>
            <td>Generate tags</td>
        </tr>
        <tr>
            <td>&lt;Leader&gt;tb</td>
            <td>Toggle Tagbar</td>
        </tr>
        <tr>
            <td>&lt;Leader&gt;tn</td>
            <td>Test nearest (vim-test)</td>
        </tr>
        <tr>
            <td>&lt;Leader&gt;tc</td>
            <td>Test class (vim-test)</td>
        </tr>
        <tr>
            <td>&lt;Leader&gt;tf</td>
            <td>Test file (vim-test)</td>
        </tr>
        <tr>
            <td>&lt;Leader&gt;ta</td>
            <td>Test suite (vim-test)</td>
        </tr>
        <tr>
            <td>&lt;Leader&gt;tl</td>
            <td>Test last (vim-test)</td>
        </tr>
        <tr>
            <td>&lt;Leader&gt;tlv</td>
            <td>Test visit (vim-test)</td>
        </tr>
        <tr>
            <td>&lt;Leader&gt;u</td>
            <td>Toggle Mundo</td>
        </tr>
        <tr>
            <td>&lt;Leader&gt;ws</td>
            <td>Clean whitespace</td>
        </tr>
        <tr>
            <td>&lt;Leader&gt;x</td>
            <td>Show TODOs in its own buffer</td>
        </tr>
        <tr>
            <td>&lt;Leader&gt;Y</td>
            <td>Bring up the YankRing</td>
        </tr>
        <tr>
            <td>&lt;Leader&gt;z</td>
            <td>Toggle zoom of current window</td>
        </tr>
        <tr>
            <td>&lt;Leader&gt;&lt;Leader&gt;</td>
            <td>Toggle HopWord</td>
        </tr>
        <tr>
            <td>&lt;Leader&gt;_</td>
            <td>Toggle HopLineStart</td>
        </tr>
        <tr>
            <td>&lt;Ctrl-y&gt;,</td>
            <td>Enable emmet expansion</td>
        </tr>
        <tr>
            <td>&lt;F2&gt;</td>
            <td>Toggle invisible characters</td>
        </tr>
        <tr>
            <td>&lt;F3&gt;</td>
            <td>Toggle Autoformat</td>
        </tr>
    </tbody>
</table>


## Plugins

Here are the plugins I use on the daily.  They are pretty amazing. :D

* [copilot.lua](https://github.com/zbirenbaum/copilot.lua) w/ [copilot-cmp](https://github.com/zbirenbaum/copilot-cmp/)
* [copilot.vim](https://github.com/github/copilot.vim)
* [ctrlp](https://github.com/ctrlpvim/ctrlp.vim)
* [devdocs.vim](https://github.com/rhysd/devdocs.vim)
* [emmet-vim](https://github.com/mattn/emmet-vim)
* [fzf.vim](https://github.com/junegunn/fzf.vim)
* [goyo.vim](https://github.com/phanimahesh/goyo.vim)
* [hop.nvim](https://github.com/phaazon/hop.nvim)
* [is.vim](https://github.com/haya14busa/is.vim)
* [lexima.vim](https://github.com/cohama/lexima.vim)
* [limelight.vim](https://github.com/junegunn/limelight.vim)
* [luasnip](https://github.com/L3MON4D3/LuaSnip)
* [luasnip-snippets](https://github.com/mireq/luasnip-snippets)
* [notational-fzf-vim](https://github.com/alok/notational-fzf-vim)
* [numbers.vim](https://github.com/myusuf3/numbers.vim)
* [nvim-cmp](https://github.com/hrsh7th/nvim-cmp/) w/ [cmp-buffer](https://github.com/hrsh7th/cmp-buffer), [cmp-path](https://github.com/hrsh7th/cmp-path), [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)
* [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
* [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
* [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)
* [scratch.vim](https://github.com/ethanmuller/scratch.vim)
* [supertab](http://github.com/ervandew/supertab)
* [tagbar](https://github.com/majutsushi/tagbar)
* [targets.vim](https://github.com/wellle/targets.vim)
* [tasklist](http://github.com/vim-scripts/TaskList)
* [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)
* [vim-abolish](https://github.com/tpope/vim-abolish)
* [vim-autoformat](https://github.com/Chiel92/vim-autoformat)
* [vim-bbye](https://github.com/moll/vim-bbye)
* [vim-commentary](https://github.com/tpope/vim-commentary)
* [vim-cursorword](https://github.com/itchyny/vim-cursorword)
* [vim-cutlass](https://github.com/svermeulen/vim-cutlass)
* [vim-devicons](https://github.com/ryanoasis/vim-devicons)
* [vim-diffchanges](http://github.com/jmcantrell/vim-diffchanges)
* [vim-disapprove-deep-indentation](https://github.com/dodie/vim-disapprove-deep-indentation)
* [vim-fold-cycle](https://github.com/arecarn/vim-fold-cycle)
* [vim-fugitive](http://github.com/tpope/vim-fugitive)
* [vim-gitgutter](https://github.com/airblade/vim-gitgutter)
* [vim-gutentags](https://github.com/ludovicchabant/vim-gutentags)
* [vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides)
* [vim-matchup](https://github.com/andymass/vim-matchup)
* [vim-move](https://github.com/matze/vim-move)
* [vim-mundo](https://github.com/simnalamburt/vim-mundo)
* [vim-over](https://github.com/osyo-manga/vim-over)
* [vim-peekaboo](https://github.com/junegunn/vim-peekaboo)
* [vim-plug](https://github.com/junegunn/vim-plug)
* [vim-polyglot](https://github.com/sheerun/vim-polyglot)
* [vim-powerline](https://github.com/Lokaltog/vim-powerline)
* [vim-projectionist](https://github.com/tpope/vim-projectionist)
* [vim-repeat](https://github.com/tpope/vim-repeat)
* [vim-speeddating](https://github.com/tpope/vim-speeddating)
* [vim-startify](https://github.com/mhinz/vim-startify)
* [vim-startuptime](https://github.com/dstein64/vim-startuptime)
* [vim-surround](https://github.com/tpope/vim-surround)
* [vim-template](https://github.com/aperezdc/vim-template)
* [vim-test](https://github.com/vim-test/vim-test)
* [vim-which-key](https://github.com/liuchengxu/vim-which-key)
* [vimade](https://github.com/tadaa/vimade)
* [yankring](https://www.vim.org/scripts/script.php?script_id=1234)
