# My .vim configuration

Here be dragons.  I periodically walk my configuration file and fix
things that aren't working for me and/or try to better optimize my development
environment.  As humans, we're generally terrible about it since we're
resistant to change.  If that doesn't suit you, you've been warned.  On the flip,
if this does suit you, it means you'll have an amazing dev editing environment.

People have asked why I don't use [Vundle](http://github.com/gmarik/vundle). I
totally would if you could map to a particular git commit/hash, but it doesn't look
like you can. Unfortunately, I enjoy explicit dependency management.


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
            <td>&lt;Leader&gt;o (or bv)</td>
            <td>Toggle BufExplorer</td>
        </tr>
        <tr>
            <td>&lt;Leader&gt;p</td>
            <td>Load up current buffer into Hammer</td>
        </tr>
        <tr>
            <td>&lt;Leader&gt;s</td>
            <td>Open scratch in split window</td>
        </tr>
        <tr>
            <td>&lt;Leader&gt;t</td>
            <td>Start a command-t search</td>
        </tr>
        <tr>
            <td>&lt;Leader&gt;T</td>
            <td>Flush command-t</td>
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
            <td>Toggle the current window</td>
        </tr>
    </tbody>
</table>


## Plugins

Here are the plugins I use on the daily.  They are pretty amazing. :D

* [abolish](http://github.com/tpope/vim-abolish)
* [ack](http://github.com/mileszs/ack.vim)
* [align](http://github.com/tsaleh/vim-align)
* [bufexplorer](http://github.com/vim-scripts/bufexplorer.zip)
* [cocoa](http://github.com/msanders/cocoa.vim)
* [command-t](http://git.wincent.com/command-t)
* [delimitMate](http://github.com/Raimondi/delimitMate)
* [diffchanges](http://github.com/jmcantrell/vim-diffchanges)
* [fugitive](http://github.com/tpope/vim-fugitive)
* [gist](http://github.com/mattn/gist-vim)
* [gundo](http://github.com/vim-scripts/Gundo)
* [hammer.vim](http://github.com/vim-scripts/hammer.vim)
* [markdown](http://github.com/tpope/vim-markdown)
* [nerdcommenter](http://github.com/scrooloose/nerdcommenter)
* [py-flakes](http://github.com/kevinw/pyflakes-vim)
* [repeat](http://github.com/tpope/vim-repeat)
* [scratch](http://github.com/duff/vim-scratch)
* [snipmate](http://github.com/spf13/snipmate.vim)
* [snipmate-snippets](http://github.com/spf13/snipmate-snippets)
* [sparkup](http://github.com/bingaman/vim-sparkup)
* [supertab](http://github.com/ervandew/supertab)
* [surround](http://github.com/tpope/vim-surround)
* [swapit](http://github.com/mjbrownie/swapit)
* [taglist-plus](http://github.com/vim-scripts/taglist-plus)
* [tasklist](http://github.com/vim-scripts/TaskList)
* [vim-rails](http://github.com/tpope/vim-rails)
* [yankring](http://github.com/vim-scripts/YankRing.vim)
* [zoomwin](http://github.com/vim-scripts/ZoomWin)
