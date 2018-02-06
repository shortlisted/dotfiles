" => .vimrc
"""""""""""
"2018-02-06

" => Plugin handler
"""""""""""""""""""
execute pathogen#infect()

" => Apperances
"""""""""""""""
set relativenumber " for easier navigation by row number
set number " still display global linenumber on current row
syntax on
" Breakindent
set linebreak
set breakindent
let &showbreak = '↳ '
let &breakat = " \t;:,])}"
" Theme and status
set background=dark
colorscheme iceberg " don't forget the appealing ones below
" gruvbox solarized dues
" Status bar
let g:airline_theme = "hybrid"
set laststatus=2
set statusline+=%*\[%n]                        "buffernr
set statusline+=%*\ %=\ row:%l/%L\ (%03p%%)\   "Rownumber/total(%)
set statusline+=%*\ \ %m%r%w\ %P\ \            "Modified? Readonly? Top/bot.
set conceallevel=2

" => Behaviors
""""""""""""""
set autoindent  " Copy indent from current line, over to the new line
filetype plugin indent on
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

" Autocommand
" comment current line depending on file type
autocmd FileType javascript nnoremap § I//<esc>
autocmd FileType python nnoremap § I#<esc>
autocmd FileType c nnoremap § I//<esc>

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

" Insert mode
" delete line in insert mode
inoremap <C-D> <esc>ddi

" Normal mode
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" yank to clipboard on mac
nnoremap <leader>c V :w !pbcopy<cr><cr>
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
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"" Let ',<tab>' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <leader><tab> :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" => Plugins
""""""""""""

" Goyo
nnoremap <silent> <leader>y :Goyo<cr>

" Ag.vim
" gv to Ag selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>
