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

map - ddp
map _ ddkP
map <space> viw
map <c-d> dd

" Note: don't add a comment after map command
