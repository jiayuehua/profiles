"
" Basic settings
"
set nocp noswf nobk
set bg=dark
syntax on
set is si ic scs hls ru sm mat=2 bs=2
set tw=80 sta sr
set fo=tcroqnmMB
set isf-==
filetype plugin indent on
au BufNewFile,BufRead * set et sts=4 sw=4
au BufNewFile,BufRead [mM]akefile*,*.mak,*.make,[mM]ake.* set noet sts=8 sw=8

" highlight trailing blank
hi! link TrailingBlank Visual
match TrailingBlank /[ \t]\+$/

" highlight char at column 81, instead of using 'cc' which confuses :sp
hi! link CharAtCol81 WarningMsg
match CharAtCol81 /\%81v/

" reset highlight color for Comment, by default it's same to Identifier
hi! Comment ctermfg=6 guifg=#80a0aa
hi! link LineNr Comment

"
" Key maps, '_' and '|' are put in version specific part
"
nmap <Space>    :set hls!<CR>|      " toggle highlight search
nmap <CR>       :set spell!<CR>|    " toggle spell
nmap <BS>       :redraw<CR>|        " backspace to redraw
nmap <C-N>      :set nu!<CR>|       " ctrl-n to toggle :set number
nmap <C-H>      /[ \t]\+$/<CR>|     " ctrl-h to highlight trailing blank
nmap <C-K>      :%s/[ \t]\+$//g<CR>|" remove trailing blank
imap <C-J>      <ESC>kJA|           " join to previous line (to workaround :fo)
nmap +          :set paste<CR>o|    " get ready to paste
nmap -          :set nopaste<CR>|   " turn off paste mode
imap jj         <ESC>
nmap \          %
nmap ,c         I/* <ESC>A */<ESC>| " comment out current line with /* */
nmap ,u         0f*h3x$xxx|         " uncomment out /* */
nmap _          :set cul!<CR>|                  " for 7.0+
nmap \|         :call ToggleColorColumn()<CR>   " for 7.3+

"
" Misc
"
set viminfo='100,<50,s10,%,h,f10    " Remember last cussor postion
au BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

"
" Version specific
"
if version >= 700
    let loaded_matchparen=0
endif

if version >= 703
    hi! link ColorColumn Search
endif

"
" Helper functions
"
function! ToggleColorColumn()
    if &cc == ""
        set cc=+1
    else
        set cc=
    endif
endfunction

" EOF
