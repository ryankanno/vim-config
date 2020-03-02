# My .vim configuration

**Here be dragons.** 

I periodically walk my configuration file and fix things that aren't working 
for me and/or try to better optimize my development environment.  As humans, 
we're generally terrible about it since we're resistant to change.  If that 
doesn't suit you, you've been warned.  On the flip, if this does suit you, 
it means you'll have an amazing dev editing environment.

## Quick Setup

### Install

curl -o - https://raw.github.com/ryankanno/vim-config/master/install.sh | bash

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
            <td>&lt;Leader&gt;b</td>
            <td>Toggle BufExplorer</td>
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
            <td>&lt;Leader&gt;n</td>
            <td>Toggle NERDTreeTabs</td>
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
            <td>&lt;Leader&gt;pb</td>
            <td>Load up current buffer into Hammer</td>
        </tr>
        <tr>
            <td>&lt;Leader&gt;(s/S)</td>
            <td>Open scratch buffer in split window</td>
        </tr>
        <tr>
            <td>&lt;Leader&gt;tag</td>
            <td>Generate ctags</td>
        </tr>
        <tr>
            <td>&lt;Leader&gt;tb</td>
            <td>Toggle Tagbar</td>
        </tr>
        <tr>
            <td>&lt;Leader&gt;u</td>
            <td>Toggle Mundo</td>
        </tr>
        <tr>
            <td>&lt;Leader&gt;w</td>
            <td>Toggle ZoomWin on the current window</td>
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
            <td>&lt;Leader&gt;&lt;Leader&gt;</td>
            <td>Toggle vim-easymotion</td>
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

* [ale](https://github.com/w0rp/ale)
* [bufexplorer](https://github.com/jlanzarotta/bufexplorer)
* [ctrlp](https://github.com/ctrlpvim/ctrlp.vim)
* [deoplete](https://github.com/Shougo/deoplete.nvim)
* [delimitMate](https://github.com/Raimondi/delimitMate)
* [devdocs.vim](https://github.com/rhysd/devdocs.vim)
* [emmet-vim](https://github.com/mattn/emmet-vim)
* [fzf.vim](https://github.com/junegunn/fzf.vim)
* [goyo.vim](https://github.com/phanimahesh/goyo.vim) - feat/add-filetype branch
* [hammer.vim](https://github.com/wikimatze/hammer.vim)
* [is.vim](https://github.com/haya14busa/is.vim)
* [limelight.vim](https://github.com/junegunn/limelight.vim)
* [nerdtree](https://github.com/scrooloose/nerdtree)
* [numbers.vim](https://github.com/myusuf3/numbers.vim/)
* [python-mode](https://github.com/klen/python-mode)
* [scratch.vim](https://github.com/ethanmuller/scratch.vim)
* [sparkup](https://github.com/rstacruz/sparkup)
* [startuptime.vim](https://github.com/tweekmonster/startuptime.vim)
* [supertab](http://github.com/ervandew/supertab)
* [tagbar](https://github.com/majutsushi/tagbar)
* [tasklist](http://github.com/vim-scripts/TaskList)
* [typescript-vim](https://github.com/leafgarland/typescript-vim)
* [ultisnips](http://github.com/SirVer/ultisnips)
* [vim-abolish](https://github.com/tpope/vim-abolish)
* [vim-autoformat](https://github.com/Chiel92/vim-autoformat)
* [vim-commentary](https://github.com/tpope/vim-commentary)
* [vim-cursorword](https://github.com/itchyny/vim-cursorword)
* [vim-devicons](https://github.com/ryanoasis/vim-devicons)
* [vim-diffchanges](http://github.com/jmcantrell/vim-diffchanges)
* [vim-disapprove-deep-indentation](https://github.com/dodie/vim-disapprove-deep-indentation)
* [vim-easymotion](https://github.com/easymotion/vim-easymotion)
* [vim-fugitive](http://github.com/tpope/vim-fugitive)
* [vim-go](https://github.com/fatih/vim-go)
* [vim-gutentags](https://github.com/ludovicchabant/vim-gutentags)
* [vim-hashicorp-tools](https://github.com/hashivim/vim-hashicorp-tools)
* [vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides)
* [vim-json](https://github.com/elzr/vim-json)
* [vim-jsx-typescript](https://github.com/peitalin/vim-jsx-typescript)
* [vim-matchup](https://github.com/andymass/vim-matchup)
* [vim-move](https://github.com/matze/vim-move)
* [vim-mundo](https://github.com/simnalamburt/vim-mundo)
* [vim-nerdtree-tabs](https://github.com/jistr/vim-nerdtree-tabs)
* [vim-over](https://github.com/osyo-manga/vim-over)
* [vim-peekaboo](https://github.com/junegunn/vim-peekaboo)
* [vim-polyglot](https://github.com/sheerun/vim-polyglot)
* [vim-powerline](https://github.com/Lokaltog/vim-powerline)
* [vim-repeat](https://github.com/tpope/vim-repeat)
* [vim-snippets](https://github.com/honza/vim-snippets)
* [vim-speeddating](https://github.com/tpope/vim-speeddating)
* [vim-startify](https://github.com/mhinz/vim-startify)
* [vim-sunaku](https://github.com/sunaku/vim-shortcut)
* [vim-surround](https://github.com/tpope/vim-surround)
* [vim-template](https://github.com/aperezdc/vim-template)
* [vimade](https://github.com/tadaa/vimade)
* [yankring](https://github.com/vim-scripts/YankRing.vim)
* [ZoomWin](https://github.com/regedarek/ZoomWin)
