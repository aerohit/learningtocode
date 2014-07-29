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
iunmap <c-d>

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

iabbrev adn and
iabbrev waht what
iabbrev tehn then
iabbrev @@      aerohit.saxena@gmail.com
iabbrev ccopy   Copyright 2014 Rohit Saxena, all rights reserved.


" ==================================
" Ch09 - More mappings
" ==================================

" Supposed to surround the current word by ", but isn't working
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap H 0
nnoremap L $


" ==================================
" Ch10 - Training your fingers
" ==================================

inoremap <esc> <nop>


" ========================================
" Ch11 - Buffer-Local Options and Mappings
" ========================================

" To define buffer specific mappings, use buffer mapping.
" A good practice is to prefer localleader over leader for
" buffer level mappings.
nnoremap <buffer> <localleader>x dd

setlocal wrap
setlocal nowrap
setlocal number
setlocal nonumber

" Shadowing, buffer level mappings are more specific and take precedence
" over normal mappings. For example in the following example, the first
" mapping would take precedence:
nnoremap <buffer> Q x
nnoremap          Q dd


" ========================================
" Ch12 - Autocommands
" ========================================

" Autocommands are a way to run certain commands when certain events happen.

" Following command creates (and saves) a .txt file as soon as they
" are opened for editing.
autocmd BufNewFile *.txt :write

autocmd BufWritePre *.html :normal gg=G

" It's possible to bind to multiple events, for example following works on
" reading and writing file.
autocmd BufWritePre,BufRead *.html :normal gg=G

autocmd BufNewFile,BufRead *.html setlocal nowrap

" It's also possible to bind to FileType events
" This event is fired when a buffers filetype is set.
autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
autocmd FileType python     nnoremap <buffer> <localleader>c I#<esc>


" ========================================
" Ch13 - Buffer-Local Abbreviations
" ========================================

" Autocommands and Abbreviations could be combined to create a little snippet
" system.
autocmd FileType python     :iabbrev <buffer> iff if:<left>
autocmd FileType javascript :iabbrev <buffer> iff if ()<left>

" For practices sake, some oft-repeated 'things' could be disabled, eg:
iabbrev <buffer> return NOPENOPENOPE


" ========================================
" Ch14 - Autocommand Groups
" ========================================

" When sourcing an autocmd, the entire vimrc file is re-read. Which means that
" the Autocommands would get duplicated as well. This would also mean that vim
" runs slower. The solution is to group related Autocommands into named
" groups.

augroup testgroup
    autocmd!
    autocmd BufWrite * :echom "FOO"
    autocmd BufWrite * :echom "BAR"
augroup END

augroup filetype_html
    autocmd!
    autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
augroup END


" ========================================
" Ch15 - Operator-Pending Mappings
" ========================================

