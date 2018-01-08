" To install vundle
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
"

Plugin 'https://github.com/scrooloose/nerdtree.git'
Plugin 'https://github.com/kien/ctrlp.vim.git'
Plugin 'https://github.com/scrooloose/nerdcommenter.git'
Plugin 'https://github.com/easymotion/vim-easymotion.git'
Plugin 'git://github.com/nathanaelkane/vim-indent-guides.git'
Plugin 'https://github.com/vim-airline/vim-airline.git'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'https://github.com/altercation/vim-colors-solarized.git'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

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
if $TERM == "xterm-256color"
  set t_Co=256
endif

set tabstop=4
set shiftwidth=4
set softtabstop=4

set number

set autoindent
set smartindent
set nowrap

"au VimEnter * if &diff | execute 'windo set wrap' | endif

:syntax on
:set ignorecase

"Required for airline status bar all the time
set laststatus=2


" http://sukiand.github.io/2016/02/12/Color%20config%20for%20putty-vim/
let g:solarized_bold = 1
let g:solarized_contrast = "low"
let g:solarized_termcolors = 256
if has('gui_running')
	set background=light
else
	set background=dark
endif

"set background=light
colorscheme solarized

set tags=./tags;/

"set cursorline
"set cursorcolumn
"hi CursorLine   cterm=NONE ctermbg=237 ctermfg=NONE guibg=darkred guifg=white
"hi CursorColumn cterm=NONE ctermbg=235 ctermfg=NONE guibg=darkred guifg=white
"

"After plugin installation
" -------------------------------------------------
"  "Putty Settings
"     "Default Forground: RGB(143,119,181)
"     "Default Bold Forground: RGB(255,255,255)
"     "Default Background: RBG(0,0,0)
"     "Default Bold Background RGB(85,85,85)
"     "Cursor Colour: RGB(240,94,28)
"     "
"     "In Putty Window->Appearance, set:
"     "Font: Consolas
"     "size: 14-point
"     "
"  "Bash
"  "export TERM=xterm-256color
"     
" -------------------------------------------------


let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='papercolor'


nnoremap <silent> <buffer> <cr> :CSearchContext<cr>
let g:EclimCSearchSingleResult='edit'
let g:EclimFileTypeValidate = 0
:nnoremap <Leader>a :CSearch -x all -p 
":nnoremap <silent> <buffer> <Leader>a<cr> :CSearch -x all -p <cr>


if &diff
	    colorscheme murphy
endif


nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

set wrap

" Delete buffer while keeping window layout (don't close buffer's windows).
" Version 2008-11-18 from http://vim.wikia.com/wiki/VimTip165
if v:version < 700 || exists('loaded_bclose') || &cp
  finish
endif
let loaded_bclose = 1
if !exists('bclose_multiple')
  let bclose_multiple = 1
endif

" Display an error message.
function! s:Warn(msg)
  echohl ErrorMsg
  echomsg a:msg
  echohl NONE
endfunction

" Command ':Bclose' executes ':bd' to delete buffer in current window.
" The window will show the alternate buffer (Ctrl-^) if it exists,
" or the previous buffer (:bp), or a blank buffer if no previous.
" Command ':Bclose!' is the same, but executes ':bd!' (discard changes).
" An optional argument can specify which buffer to close (name or number).
function! s:Bclose(bang, buffer)
  if empty(a:buffer)
    let btarget = bufnr('%')
  elseif a:buffer =~ '^\d\+$'
    let btarget = bufnr(str2nr(a:buffer))
  else
    let btarget = bufnr(a:buffer)
  endif
  if btarget < 0
    call s:Warn('No matching buffer for '.a:buffer)
    return
  endif
  if empty(a:bang) && getbufvar(btarget, '&modified')
    call s:Warn('No write since last change for buffer '.btarget.' (use :Bclose!)')
    return
  endif
  " Numbers of windows that view target buffer which we will delete.
  let wnums = filter(range(1, winnr('$')), 'winbufnr(v:val) == btarget')
  if !g:bclose_multiple && len(wnums) > 1
    call s:Warn('Buffer is in multiple windows (use ":let bclose_multiple=1")')
    return
  endif
  let wcurrent = winnr()
  for w in wnums
    execute w.'wincmd w'
    let prevbuf = bufnr('#')
    if prevbuf > 0 && buflisted(prevbuf) && prevbuf != w
      buffer #
    else
      bprevious
    endif
    if btarget == bufnr('%')
      " Numbers of listed buffers which are not the target to be deleted.
      let blisted = filter(range(1, bufnr('$')), 'buflisted(v:val) && v:val != btarget')
      " Listed, not target, and not displayed.
      let bhidden = filter(copy(blisted), 'bufwinnr(v:val) < 0')
      " Take the first buffer, if any (could be more intelligent).
      let bjump = (bhidden + blisted + [-1])[0]
      if bjump > 0
        execute 'buffer '.bjump
      else
        execute 'enew'.a:bang
      endif
    endif
  endfor
  execute 'bdelete'.a:bang.' '.btarget
  execute wcurrent.'wincmd w'
endfunction
command! -bang -complete=buffer -nargs=? Bclose call s:Bclose('<bang>', '<args>')
nnoremap <silent> <Leader>bd :Bclose<CR>
