""""""""""""
" => General
""""""""""""

" Behaviors

set number " still display global linenumber on current row
set relativenumber " for easier navigation by row number
syntax on
filetype plugin indent on
set t_Co=256
set history=1000
set autoread
set wildmenu
execute pathogen#infect()
set pastetoggle=<F2>
" Tabs
set tabstop=2
set shiftwidth=2
set expandtab
" Folds
set foldmethod=manual

" Searches
set ignorecase

""""""""""""
" => Apperance
""""""""""""

" Looks
"set textwidth=80
set breakindent
set showbreak=\\\\\
set background=dark
"colors dues
colors gruvbox
" concellevel?
set conceallevel=2

" Resizing
autocmd VimResized * wincmd =

" Status bar
set laststatus=2
set statusline+=%*\[%n]                        "buffernr
set statusline+=%*\ %=\ row:%l/%L\ (%03p%%)\   "Rownumber/total(%)
set statusline+=%*\ \ %m%r%w\ %P\ \            "Modified? Readonly? Top/bot.

" Autocommand
" comment current line depending on file type
autocmd FileType javascript nnoremap <leader>k I//<esc>
autocmd FileType python nnoremap <leader>k I#<esc>
autocmd FileType c nnoremap <leader>k I//<esc>
"autocmd FileType html nnoremap <leader>c <!--<esc>
"autocmd FileType c set makeprg=gcc\ $*\ $*

""""""""""""
" => Keys 
""""""""""""

" Changed behaviors
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Leader key
let mapleader = ","
let g:mapleader = ","

" Insert mode
inoremap <c-d> <esc>ddi
inoremap <c-u> <esc>Ui

" Normal mode
nnoremap <space> /
nnoremap <c-u> U
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>o :tabe .<cr>
nmap <leader>w :w<cr>
nnoremap <leader>c V :w !pbcopy<cr><cr>
" Sane keys for swedish keyboard
" command, next fFtT, register, next paragraph, toggle case, indent
map ö : 
map Ö ;
map ä %
map å {
map Ä ~
map Å }

"" Tabs
nnoremap <leader>< :tabprevious<cr>
nnoremap <leader>z :tabnext<cr>

"" Splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"" Let ',<tab>' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <leader><tab> :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

""""""""""""
" => Plugins
""""""""""""

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" Goyo
nnoremap <silent> <leader>y :Goyo<cr>

" Ag.vim
" gv to Ag selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

" ,g to open Ag and place cursor
map <leader>g :Ag

" ,r to search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" see :help cope for cope features 

" Display Ag search results in cope:
map <leader>cc :botright cope<cr>
 
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg

" Next search result in cope
map <leader>n :cn<cr>

" Previous serach result in cope
map <leader>p :cp<cr>

""""""""""""
" => Markup 
""""""""""""

" Wikipedia formatting

nnoremap <leader>' viw<esc>a'''<esc>Bi'''<esc>E
nnoremap <leader>wt i{\|<space>class="wikitable"<cr>!<space>Rubrik<space>!!<space>Rubrik<cr>\|-<cr>\|<space>Celltext<space>\|\|Celltext<cr>\|-<cr>\|}<esc>
nnoremap <leader>wr $o\|<space>Celltext<space>\|\|<space>Celltext<cr>\|-<esc>
nnoremap <leader>we $a<space>\|\|<space>Celltext<esc>
nnoremap -nw i<nowiki></nowiki><esc>l3ba
nnoremap <leader>syn i<syntaxhighlight lang="mysql"> </syntaxhighlight><esc>Bhxi

" With inspiration from:
"https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim
