" Comments in Vimscript start with a `"`.

" If you open this file in Vim, it'll be syntax highlighted for you.

" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).
set nocompatible
syntax on " Turn on syntax highlighting.

" Spaces & Tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4        " number of visual spaces per TAB
set softtabstop=4    " number of spaces in tab when editing
set shiftwidth=4     " Insert 4 spaces on a tab
set expandtab        " tabs are spaces, mianly beacause of python

" UI Config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on
set shortmess+=I       " Disable the default Vim startup message.
set number             " Show line numbers.
set relativenumber     " This enables relative line numbering mode.
set laststatus=2       " Always show the status line at the bottom.
set mouse+=a           " Enable mouse support
set noerrorbells visualbell t_vb= " Disable audible bell 
set showmatch          " highlight matching [{()}]
set showcmd            " show command in bottom bar
set splitbelow         " open new vertical split bottom
set splitright         " open new horizontal split right
set cursorline         " highlight current line

" Buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hidden    " Allows having hidden buffers (not displayed in any window)

" Sensible stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backspace=indent,eol,start " Make backspace behave in a more intuitive way.
" 'Q' in normal mode enters Ex mode. You almost never want this.
nmap Q <Nop>                   
" Unbind for tmux
map <C-a> <Nop> 
map <C-x> <Nop> 

" Searching
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase         " Ignore case in searchs.
set smartcase          " Make it case sensitive if an uppercase is entered.
set incsearch          " Enable searching as you type, rather than waiting till you press enter.

" Misc 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

" Plugins 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-colors-solarized
" If you are going to use Solarized in Terminal mode (i.e. not in a GUI
" version 
" like gvim or macvim), **please please please** consider setting your
" terminal 
" emulator's colorscheme to used the Solarized palette
" palette repo: https://github.com/altercation/solarized

" syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" nerdtree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>f :NERDTreeFind<CR>

" gundo
nnoremap <Leader>u :GundoToggle<CR>
if has('python3')
    let g:gundo_prefer_python3 = 1
endif
