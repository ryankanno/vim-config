# My .vim configuration

Here be dragons.  I periodically walk my configuration file and fix
things that aren't working for me and/or try to better optimize my development
environment.  As humans, we're generally terrible about it since we're
resistant to change.  If that doesn't suit you, you've been warned.  On the flip,
if this does suit you, it means you'll have an amazing dev editing environment.

## Updates

### 2018-05-31

* Removed py-flakes
* Removed syntastic :(
* Added ale

### 2016-05-03

* Added python-mode
* Added vim-template

### 2015-06-24

* Updated all plugins to latest
* Added vim-autoformat
* Added vim-erl
* Added vim-go
* Added vim-mutiple-cursors
* Added vim-over
* Added vim-speeddating
* Added vimproc

### 2015-05-11

* Changed scratch buffer to https://github.com/ethanmuller/scratch.vim
* Mapped &lt;Leader&gt;Sb to a scratch buffer in a new vertical split

### 2014-05-11

* Updated plugins
* Added vim-indent-guides
* Changed scratch buffer from &lt;Leader&gt;s to &lt;Leader&gt;sb

### 2013-09-25

* Added vim-easymotion
* Changed zoomwin from &lt;Leader&gt;&lt;Leader&gt; to &lt;Leader&gt;w

### 2013-05-01

* Migrated from ack -> the silver searcher

### 2013-02-09

* Migrated from snipmate -> ultisnips (still waiting to see what will happen to snipmate snippets)
* Switched from command-t -> ctrlp

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
            <td>&lt;Leader&gt;f</td>
            <td>Start an Ack search</td>
        </tr>
        <tr>
            <td>&lt;Leader&gt;h/l</td>
            <td>Next/prev in jumplist</td>
        </tr>
        <tr>
            <td>&lt;Leader&gt;G</td>
            <td>Private gist (assuming you complete the github api install)</td>
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
            <td>&lt;Leader&gt;o (or bv)</td>
            <td>Toggle BufExplorer</td>
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
            <td>&lt;Leader&gt;sb</td>
            <td>Open scratch buffer in split window</td>
        </tr>
        <tr>
            <td>&lt;Leader&gt;tag</td>
            <td>Generate ctags</td>
        </tr>
        <tr>
            <td>&lt;Leader&gt;tl</td>
            <td>Toggle Taglist</td>
        </tr>
        <tr>
            <td>&lt;Leader&gt;u</td>
            <td>Toggle gundo</td>
        </tr>
        <tr>
            <td>&lt;Leader&gt;w</td>
            <td>Toggle the current window</td>
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
    </tbody>
</table>


## Plugins

Here are the plugins I use on the daily.  They are pretty amazing. :D

### Vim8

* [ZoomWin](https://github.com/regedarek/ZoomWin)
* [ale](https://github.com/w0rp/ale)
* [autotag](https://github.com/vim-scripts/AutoTag)
* [bufexplorer](https://github.com/jlanzarotta/bufexplorer)
* [ctrlp](https://github.com/ctrlpvim/ctrlp.vim)
* [delimitMate](https://github.com/Raimondi/delimitMate)
* [gist-vim](http://github.com/mattn/gist-vim)
* [nerdcommenter](https://github.com/scrooloose/nerdcommenter)
* [nerdtree](https://github.com/scrooloose/nerdtree)
* [numbers.vim](https://github.com/myusuf3/numbers.vim/)
* [scratch.vim](https://github.com/ethanmuller/scratch.vim)
* [sparkup](https://github.com/rstacruz/sparkup)
* [supertab](http://github.com/ervandew/supertab)
* [tasklist](http://github.com/vim-scripts/TaskList)
* [ultisnips](http://github.com/SirVer/ultisnips)
* [vim-abolish](https://github.com/tpope/vim-abolish)
* [vim-easymotion](https://github.com/easymotion/vim-easymotion)
* [vim-go](https://github.com/fatih/vim-go)
* [vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides)
* [vim-json](https://github.com/elzr/vim-json.git)
* [vim-nerdtree-tabs](https://github.com/jistr/vim-nerdtree-tabs)
* [vim-over](https://github.com/osyo-manga/vim-over)
* [vim-peekaboo](https://github.com/junegunn/vim-peekaboo)
* [vim-powerline](https://github.com/Lokaltog/vim-powerline)
* [vim-repeat](https://github.com/tpope/vim-repeat)
* [vim-snippets](https://github.com/honza/vim-snippets)
* [vim-speeddating](https://github.com/tpope/vim-speeddating)
* [vim-surround](https://github.com/tpope/vim-surround)
* [vim-template](https://github.com/aperezdc/vim-template)
* [yankring](https://github.com/vim-scripts/YankRing.vim)

### Pathogen-style

* [ack](http://github.com/mileszs/ack.vim)
* [diffchanges](http://github.com/jmcantrell/vim-diffchanges)
* [fugitive](http://github.com/tpope/vim-fugitive)
* [gundo](http://github.com/vim-scripts/Gundo)
* [hammer.vim](http://github.com/vim-scripts/hammer.vim)
* [markdown](http://github.com/tpope/vim-markdown)
* [omnisharp-vim](https://github.com/OmniSharp/omnisharp-vim)
* [python-mode](https://github.com/klen/python-mode)
* [vim-autoformat](https://github.com/Chiel92/vim-autoformat)
* [vim-mutiple-cursors](https://github.com/terryma/vim-multiple-cursors)
* [vim-pathogen](https://github.com/tpope/vim-pathogen)
* [vim-rails](https://github.com/tpope/vim-rails)
* [vimerl](https://github.com/jimenezrick/vimerl)
* [vimproc](https://github.com/Shougo/vimproc.vim)
* [webapi-vim](http://github.com/mattn/webapi-vim.git)
