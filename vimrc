" => .vimrc
"""""""""""
"2018-02-08

"trying Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'mileszs/ack.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-dispatch'
Plugin 'othree/eregex.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/goyo.vim'
Plugin 'wikitopian/hardmode'
Plugin 'Yggdroot/indentline'
Plugin 'junegunn/limelight.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'tmhedberg/matchit'
Plugin 'scrooloose/nerdtree'
Plugin 'reedes/vim-pencil'
Plugin 'tpope/vim-surround'
Plugin 'vim-syntastic/syntastic'
Plugin 'tpope/vim-commentary'
Plugin 'danilo-augusto/vim-afterglow' " theme
Plugin 'Badacadabra/vim-archery' " theme
Plugin 'challenger-deep-theme/vim' " theme
Plugin 'nightsense/vimspectr' " theme

call vundle#end()
filetype plugin indent on

" => Apperances
"""""""""""""""
set relativenumber " for easier navigation by row number
set number " still display global linenumber on current row

" Theme and status
syntax on
set background=dark
set termguicolors
colorscheme flattened_dark
" nice: gruvbox solarized dues archery

let g:airline_solarized_bg='dark'
set laststatus=2
set statusline+=%*\[%n] "buffernr
set statusline+=%*\ %=\ row:%l/%L\ (%03p%%)\  "rown/total/%
set statusline+=%*\ \ %m%r%w\ %P\ \ "Modified? Readonly? Top/bot.
set conceallevel=2

" Breakindent
set linebreak
set breakindent
let &showbreak = '↳ '
let &breakat = " \t;:,])}"

" => Behaviors
""""""""""""""
set autoindent  " Copy indent from current line, over to the new line
set history=1000
set autoread
set wildmenu
set pastetoggle=<F2>
" Tabs
set tabstop=8
set softtabstop=2
set shiftwidth=2
set expandtab
" Folds
set foldmethod=manual
" Search
set ignorecase
" Resizing
autocmd VimResized * wincmd =
" EOL behaviors
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Skip syntastic for python
let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }

" wrap on diff-files
autocmd FilterWritePre * if &diff | setlocal wrap< | endif

" => Keys 
""""""""""""

" Leader key
let mapleader = "\<Space>"

" Remaps

" Sane keys for swedish keyboard
" Square bracketx2, search backwards, register, command, next fFtT,
map å [
map Å ]
map ä /
map Ä "
map ö :
map Ö ;
map <Up> gk
map <Down> gj

" Insert mode
" delete line in insert mode
inoremap <C-D> <esc>ddi
inoremap <Up> <esc>gki
inoremap <Down> <esc>gji
" insert from clipboard 
inoremap <C-v> <C-r><C-o>+

" Visual mode
" Copy to system clipboard
vnoremap <C-c> "+y

" Normal mode
" Yank movement to clipboard
nnoremap <C-c> "+y

" Save file from normal mode
nnoremap <C-s> :w<cr>

" NERDTree
nnoremap <C-n> :NERDTree<cr>
nnoremap <leader>f :NERDTreeToggle<cr>

" Comments
nnoremap § :Commentary<cr>
vnoremap § :Commentary<cr>

" Vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" for insane hard mode
nnoremap <leader>hm :call HardMode()<cr>
" for sanity and easy mode:
nnoremap <leader>em :call EasyMode()<cr>
" Tabs
nnoremap <leader>< :tabprevious<cr>
nnoremap <leader>z :tabnext<cr>
" Open new tab
nnoremap <leader>t :tabe 
" Move in splits like a sane person
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>

"" Let '<Space><tab>' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <leader><tab> :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" => Plugins
""""""""""""

" Goyo
nnoremap <silent> <leader>y :Goyo<cr>
