""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin:
""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-commentary'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'easymotion/vim-easymotion'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

""""""""""""""""""""""""""""""""""""""""""""""""""
" General:
""""""""""""""""""""""""""""""""""""""""""""""""""

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" filetypes
filetype indent on

" Enable Line numbers
set number

" Visual Style
syntax enable
set background=dark
colorscheme solarized

" Set encoding
set encoding=utf-8

" Set proper color allowance
set term=screen-256color

" Tab Behaviour
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" make backspace behave in a sane manner
set backspace=indent,eol,start

" Easy run a python script
autocmd FileType python nnoremap <leader>r :exec '!clear;python' shellescape(@%, 1)<CR>

if has('mouse')
        set mouse=a
        set ttymouse=xterm2
endif

set nocompatible " not compatible with vi
set autoread " detect when a file is changed
set wildmenu " enhanced command line completion

set clipboard=unnamed

" faster redrawing
set ttyfast

" set a map leader for more key combos
let mapleader = ','
let g:mapleader = ','

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" remove extra whitespace
nmap <leader><space> :%s/\s\+$<cr>

" disable Ex mode
noremap Q <NOP>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Navigation:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set splitbelow
set splitright

map <silent> <C-h> :call WinMove('h')<cr>
map <silent> <C-j> :call WinMove('j')<cr>
map <silent> <C-k> :call WinMove('k')<cr>
map <silent> <C-l> :call WinMove('l')<cr>

" moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> ^ g^
nnoremap <silent> $ g$

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Highlight searches as they are typed.
set incsearch

" Disable search highlight
nnoremap <CR> :noh<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Formatting:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set pastetoggle=<F2>

function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" Remap <F5> to stripping white spaces
noremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>

" Automatically strip white spaces upon closing a file
autocmd BufWritePre *.sh,*.py,*.js :call <SID>StripTrailingWhitespaces()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Window movement shortcuts
" move to the window in the direction shown, or create a new window
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Settings:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" fix navigation problem with terminal
let g:NERDTreeDirArrows=0
" close NERDTree after a file is opened
let g:NERDTreeQuitOnOpen=1
" show hidden files in NERDTree
let NERDTreeShowHidden=1
" remove some files by extension
let NERDTreeIgnore = ['\.js.map$', '\.pyc$']
" Toggle NERDTree
nmap <silent> <leader>n :NERDTreeToggle<cr>
" expand to the path of the file in the current buffer
nmap <silent> <leader>fs :NERDTreeFind<cr>

" Keep docstring for folds
let g:SimpylFold_docstring_preview=1

" map fuzzyfinder (CtrlP) plugin
" let g:ctrlp_map='<leader>t'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_dotfiles=1
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

" Fugitive Shortcuts
nmap <silent> <leader>gs :Gstatus<cr>
nmap <leader>ge :Gedit<cr>
nmap <silent><leader>gr :Gread<cr>
nmap <silent><leader>gb :Gblame<cr>

" airline options
set laststatus=2 " Show airline all the time
let g:airline_powerline_fonts=1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='base16'

if (has("gui_running"))
    set guioptions=egmrt
    set background=light
    colorscheme solarized
    let g:airline_left_sep=''
    let g:airline_right_sep=''
    let g:airline_powerline_fonts=0
    let g:airline_theme='solarized'
endif

" YouCompletMe options
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

let g:UltiSnipsExpandTrigger       = "<c-j>"
let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-h>"
let g:UltiSnipsListSnippets        = "<c-k>" "List possible snippets based on current file

""""""""""""""""""""""""""""""""""""""""""""""""""
" Language Specific:
""""""""""""""""""""""""""""""""""""""""""""""""""
"define BadWhitespace before using in a match
highlight BadWhitespace ctermbg=red guibg=darkred

au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

""""""""""""""""""""""""""""""""""""""""""""""""""
" VirtualEnv Support:
""""""""""""""""""""""""""""""""""""""""""""""""""
"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

