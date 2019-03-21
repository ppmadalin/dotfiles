" .vimrc config file
" 
" Author: Madalin Popa
" Email: contact@madalinpopa.com

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VUNDLE SETUP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" INSTALLED PLUGINS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN SETUP
Plugin 'mileszs/ack.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'davidhalter/jedi-vim'
Plugin 'klen/python-mode'
Plugin 'kien/ctrlp.vim'
Plugin 'godlygeek/tabular'
Plugin 'ayu-theme/ayu-vim'
Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN SETUP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"------------Start Python PEP 8 stuff----------------
" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

"spaces for indents
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=100

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Set the default file encoding to UTF-8:
set encoding=utf-8

" For full syntax highlighting:
let python_highlight_all=1
syntax on

" Keep indentation level from previous line:
autocmd FileType python set autoindent

" make backspaces more powerfull
set backspace=indent,eol,start


"Folding based on indentation:
autocmd FileType python set foldmethod=indent
"use space to open folds
nnoremap <space> za
"----------Stop python PEP 8 stuff--------------

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CTRL-P
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 0

let g:ctrlp_map = '<c-f>'
map <leader>j :CtrlP<cr>
map <c-b> :CtrlPBuffer<cr>

let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au VimEnter *  NERDTree 
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['python3']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Navigation setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding with the spacebar
nnoremap <space> za


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Basic Setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Split setup windows
set splitbelow			" default split below
set splitright			" default split to righ
set visualbell			" enable visualbell
set t_vb=			" set visualbell to none
" Search setup
set smartcase			" search smartcase
set incsearch			" increase search
set ignorecase			" case insensitive
" Fold setup
set foldmethod=indent		" fold method
set foldlevel=99		" maxim lines to fold
" Dsable backup and swap files
set nobackup			" no backup files
set nowritebackup		" no write backup
set noswapfile			" no create swap fle
" Easier moving of code block
vnoremap < <gv 			" better identation
vnoremap > >gv			" better identation
" Show line numbers and lenght
set number 			" show line numbers
set tw=79			" width of the document
set nowrap 			" don't automatically wrap on load
set fo-=t			" don't automaticlly wrap text
set colorcolumn=80
highlight ColorColumn ctermbg=233
" Use spaces instead of TABs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab




" Plug 'ayu-theme/ayu-vim' " or other package manager
"...
set termguicolors     " enable true colors support
let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme
" let ayucolor="dark"   " for dark version of theme
colo ayu

" powerline
set rtp+=/usr/local/lib/python3.7/site-packages/powerline/bindings/vim
set laststatus=2
set t_Co=256

if has('gui_running')
  set guifont=Menlo:h15
endif











