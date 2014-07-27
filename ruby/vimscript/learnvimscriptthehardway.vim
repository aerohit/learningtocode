" ==================================
" Ch01 - Echoing messages
" ==================================

echo "Non-persistent message"

echom "Persistent message"

"messages                                " to view the list of messages


" ==================================
" Ch02 - Setting Options
" ==================================

" Boolean options
set number                              " set line number
set nonumber                            " don't set line number
set number!                             " toggle line number setting
set number?                             " checking the option

" Options with values
set numberwidth=4
set numberwidth?
set wrap?
set shiftround?
set matchtime?

" Setting multiple options on a single line
set number numberwidth=4


" ==================================
" Ch03 - Basic Mapping
" ==================================

" To map keys
map - ddp
map _ ddkP
map <space> viw
map <c-d> dd

" To unmap keys
unmap <space>

" Note: don't add a comment after map command


" ==================================
" Ch04 - Modal Mapping
" ==================================

nmap \ dd
vmap \ U
imap <c-d> <esc>ddi

" To unmap
nunmap \
vunmap \
iunmap \

" Upcase the current word
imap <c-u> <esc>viwUi
nmap <c-u> viwU


" ==================================
" Ch05 - Strict Mapping
" ==================================

nnoremap \ dd
vnoremap \ U
inoremap <c-d> <esc>ddi


" ==================================
" Ch06 - Leaders
" ==================================

nnoremap -d dd
nnoremap -c ddO
nnoremap <leader>d dd

let mapleader = "-"
let maplocalleader = "\\"
" Note: localleader could be used for prefixing certain types of files.


" ==================================
" Ch08 - Abbreviations
" ==================================
