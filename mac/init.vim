"+++++++++++++++++++++++++++++++++++
" TITLE: NVIM SETUP                +
" MAINTAINER: Popa Madalin         +
"+++++++++++++++++++++++++++++++++++

let mapleader = ","
filetype off                 

" Setup the vim-plug
call plug#begin('~/.local/share/nvim/plugged')

Plug 'davidhalter/jedi-vim'
Plug 'zchee/deoplete-jedi'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'davidhalter/jedi-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'vim-syntastic/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()


"+++++++++++++++++++++++++++++++++++
" Plugins Setup                    +
"+++++++++++++++++++++++++++++++++++


" Syntastic settings

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['python3']


" NERDTree settings
"
let NERDTreeIgnore=['\sublime.project$','\workspace$', '\.pyc$', '\~$'] 
let NERDTreeIgnore = ['\.pyc$', '__pycache__']

" au VimEnter *  NERDTree 
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=0
let g:NERDTreeWinSize=35
" let g:NERDTreeDirArrowExpandable = '?'
" let g:NERDTreeDirArrowCollapsible = '?'

map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>


" Deoplete settings
"
" pip install pynvim  -> this is for python auto-completion
" pip install jedi -> this is for deoplete python auto-completion
let g:deoplete#enable_at_startup = 1
" To close automaticly the auto completion
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" Use Tab to navigate through auto-completion
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"


" Airline settings
" 
" To set a specific theme
let g:airline_theme='ayu_dark' " <theme> is a valid theme name

let g:airline_powerline_fonts = 1

" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ''

" Nerdcommenter
"
" <leader>cc
" <leader>cu


" Davidhalter Jedi-Vim
"
"
" disable autocompletion, cause we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

" How to use jedi-vim
" <leader>d: go to definition
" K: check documentation of class or method
" <leader>n: show the usage of a name in current file
" <leader>r: rename a name
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>T"


"+++++++++++++++++++++++++++++++++++
" File Type Setup                  +
"+++++++++++++++++++++++++++++++++++


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

" For full syntax highlighting:
let python_highlight_all=1

"------------HTML, Javascript, CSS-------------------
au BufNewFile,BufRead *.js, *.html, *.css set tabstop=2
au BufNewFile,BufRead *.js, *.html, *.css set softtabstop=2
au BufNewFile,BufRead *.js, *.html, *.css set shiftwidth=2


"+++++++++++++++++++++++++++++++++++
" Navigation Setup                 +
"+++++++++++++++++++++++++++++++++++
"
"
" Disable arrow navigation
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


"+++++++++++++++++++++++++++++++++++
" Shortcuts Setup                    +
"+++++++++++++++++++++++++++++++++++
"
"
noremap <F4> :! mypy .<CR>
noremap <F5> :! pytest --cov-report term-missing --cov='.'<CR>



"+++++++++++++++++++++++++++++++++++
" Basic Setup                    +
"+++++++++++++++++++++++++++++++++++
"
"
let g:python3_host_prog = '/usr/local/bin/python3.7'
syntax on			            " syntax highlighting
set nobackup                    " set no backup
set relativenumber              " set relative numver
set nowb                        " set no write buffer
set noswapfile                  " set no swapfile
set wildmenu                    " enable wildmenu pop up
set wildmode=longest:full,full  " wildmode setup
set nu                          " line number
set splitbelow                  " default orizontal split below
set splitright                  " default vertical split right			                
set encoding=utf-8	        " default encoding
set clipboard=unnamed	        " common clipboard
set backspace=indent,eol,start	" backspace fix
set noerrorbells                " no error bells
set novisualbell                " no visual bells
set t_vb=                       " disable visual bell
set tm=500                      " no visual errors
set smartcase			                
set ignorecase			                
set incsearch
set nohlsearch
set foldmethod=indent	            	
set foldlevel=99	                	
set ai                          "Auto indent
set si                          "Smart indent
set wrap                        "Wrap lines

" row highlight setup
set cursorline
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#303000 ctermbg=235
set hidden " hide buffers by default

" column highlight setup
" set colorcolumn=80  " enable color column
" highlight ColorColumn guibg=#303000 ctermbg=235

" Use spaces instead of TABs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position
set ruler
" Height of the command bar
set cmdheight=2

if has('gui_running')
	set guioptions-=g
	set guioptions-=m
	set guioptions-=r
	set guioptions-=L
	set guioptions-=t
	set guioptions-=T
	set guioptions+=c
	set termguicolors     
    set guifont=Fira_Code:h15
    set background=light
    colorscheme goodwolf
else
    set background=light
    set termguicolors
    colorscheme goodwolf
endif
