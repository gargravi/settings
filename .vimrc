:imap jj <Esc>
:nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
:nnoremap <Leader>f :echo expand('%:p')

"Copy word under cursor
:map _c bvey

"Comment C++ current line
":map cc 0i//<Esc>

"replace curretn word with auto
":map tt bdwiauto <Esc>

":colorscheme slate

set tabstop=4
set shiftwidth=4
set softtabstop=4

set number

set autoindent
set smartindent
set nowrap



