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
Plugin 'git://git.wincent.com/command-t.git'

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

:syntax on

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

set cursorline
"set cursorcolumn
hi CursorLine   cterm=NONE ctermbg=237 ctermfg=NONE guibg=darkred guifg=white
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






