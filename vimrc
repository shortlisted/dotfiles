""""""""""""
" => General
""""""""""""

" Behaviors

set number
syntax on
filetype plugin indent on
set t_Co=256
set history=1000
set autoread
set wildmenu
execute pathogen#infect()

" Searches
set smartcase

""""""""""""
" => Apperance
""""""""""""

" Status bar
set laststatus=2
set statusline+=%*\[%n]                        "buffernr
set statusline+=%*\ %=\ row:%l/%L\ (%03p%%)\   "Rownumber/total(%)
set statusline+=%*\ \ %m%r%w\ %P\ \            "Modified? Readonly? Top/bot.

" Autocommand
autocmd FileType javascript nnoremap <leader>c I//<esc>
autocmd FileType python nnoremap <leader>c I#<esc>

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
nmap <leader>w :w<cr>

"" Tabs
nnoremap <leader>< :tabprevious<cr>
nnoremap <leader>z :tabnext<cr>

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

" With inspiration from:
"https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim
"https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim
