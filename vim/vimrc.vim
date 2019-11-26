""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin:
""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-tmux-navigator'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/indentpython.vim'
Plug 'scrooloose/syntastic'
Plug 'nvie/vim-flake8'
Plug 'jnurmine/Zenburn'
Plug 'flazz/vim-colorschemes'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""
" General:
""""""""""""""""""""""""""""""""""""""""""""""""""

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" filetypes
filetype indent on

" Enable Line numbers
set relativenumber

" Visual Style
syntax enable
set background=dark
colorscheme dracula

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

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile
set autoread " detect when a file is changed
set wildmenu " enhanced command line completion

set clipboard=unnamed

" faster redrawing
set ttyfast

" make backspace behave in a sane manner
set backspace=indent,eol,start

" Enable folding
set foldmethod=indent
set foldlevel=99

" Make splits behave as expected
set splitbelow
set splitright

""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings:
""""""""""""""""""""""""""""""""""""""""""""""""""

" set a map leader for more key combos
let mapleader = " "
let g:mapleader = " "

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
" Enable folding with the spacebar
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

nnoremap <leader>i za

" remove extra whitespace
noremap <leader>w :call <SID>StripTrailingWhitespaces()<CR>

" disable Ex mode
noremap Q <NOP>

" Easy navigation of lines
nnoremap H 0
nnoremap L $
nnoremap J G
nnoremap K gg

" quickly select whole line
nnoremap vv 0v$
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Navigation:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('mouse')
    set mouse=a
    set ttymouse=xterm2
endif

" Move lines up and down using ALT+[JK]
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==

inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi

vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

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

nnoremap n nzzzv
nnoremap N Nzzzv

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

" Easy run a python script
autocmd FileType python nnoremap <leader>r :exec '!clear;python' shellescape(@%, 1)<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Settings:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set leader / to comment line
nmap <silent> <leader>/ :Commentary<cr>
vmap <silent> <leader>/ :Commentary<cr>

" fix navigation problem with terminal
let g:NERDTreeDirArrows=1
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
let g:NERDTreeNodeDelimiter = "\u00a0"

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
"

" Set ultisnips triggers
let g:UltiSnipsExpandTrigger="<tab>"
if !exists("g:UltiSnipsJumpForwardTrigger")
        let g:UltiSnipsJumpForwardTrigger = "<tab>"
endif
if !exists("g:UltiSnipsJumpBackwardTrigger")
        let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
endif

""""""""""""""""""""""""""""""""""""""""""""""""""
" Language Specific:
""""""""""""""""""""""""""""""""""""""""""""""""""
" Language Specific

" Load tabs
so ~/dotfiles/vim/tabs.vim

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
