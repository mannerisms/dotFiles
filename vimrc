""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL
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

" Easy run a python script
autocmd FileType python nnoremap <leader>r :exec '!clear;python' shellescape(@%, 1)<CR>

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
map <silent> <leader><space> :silent :nohlsearch<cr>

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
