if has('gui_macvim')
    set runtimepath+=~/macpathogen
endif

execute pathogen#infect()

set nocp
filetype plugin on

"Laptops with crappy Esc button
imap jj <Esc>

"set modifiable on (creating new files)
set autochdir 

"Recursive find
if has('win32')
    set path+=.\**
else
    set path+=$PWD/**
endif

" - font type and size setting.
if has('win32')
"    set guifont=Consolas:h12   " Win32.
elseif has('gui_macvim')
    set guifont=Monaco:h14     " OSX.
else
    set guifont=Monospace\ 12  " Linux.
endif

" NERDTree Configuration
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 60
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" VIM Configuration File
" Description: Optimized for C/C++ development, but useful also for other things.
" Author: Gerhard Gappmeier
"

" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
" disable vi compatibility (emulation of old bugs)
set nocompatible
" use indentation of previous line
set autoindent
" use intelligent indentation for C
set smartindent
" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces
" wrap lines at 120 chars. 80 is somewaht antiquated with nowadays displays.
set textwidth=120
" turn syntax highlighting on
set t_Co=256
syntax on
if (has('gui_running') || has('gui_macvim')) 
set lines=50 columns=100
endif
colorscheme desert256 
" turn line numbers on
set number
" highlight matching braces
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

" Install OmniCppComplete like described on http://vim.wikia.com/wiki/C++_code_completion
" This offers intelligent C++ completion when typing ‘.’ ‘->’ or <C-o>
" Load standard tag files
set tags+=~/vimfiles/tags/cpp
set tags+=~/vimfiles/tags/gl
set tags+=~/vimfiles/tags/sdl
set tags+=~/vimfiles/tags/qt4

" Install DoxygenToolkit from http://www.vim.org/scripts/script.php?script_id=987
let g:DoxygenToolkit_authorName="Pamir Saatcioglu<pamirsa@yahoo.com>"

" Enhanced keyboard mappings
"
" in normal mode F2 will save the file
nmap <F2> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i
" switch between header/source with F4
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
" recreate tags file with F5
map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
" create doxygen comment
map <F6> :Dox<CR>
" build using makeprg with <F7>
map <F7> :make<CR>
"match whitespace
map <F8> :match ExtraWhitespace /\s\+$/
"delete whitespace
map <F9> :%s/\s\+$//
" build using makeprg with <S-F7>
map <S-F7> :make clean all<CR>
" goto definition with F12
map <F12> <C-]>
