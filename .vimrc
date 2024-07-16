call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
call plug#end()

set termguicolors
colorscheme gruvbox
nnoremap <silent> [oh :call gruvbox#hls_show()<CR>
nnoremap <silent> ]oh :call gruvbox#hls_hide()<CR>
nnoremap <silent> coh :call gruvbox#hls_toggle()<CR>

nnoremap * :let @/ = ""<CR>:call gruvbox#hls_show()<CR>*
nnoremap / :let @/ = ""<CR>:call gruvbox#hls_show()<CR>/
nnoremap ? :let @/ = ""<CR>:call gruvbox#hls_show()<CR>?
set background=dark

syntax on

set tabstop=4
set shiftwidth=4

set mouse=a
set number
set incsearch
set hlsearch
set autoindent
set smartindent
set cindent
set showmatch
set ruler
set relativenumber
set cursorline
set clipboard=unnamedplus

filetype plugin indent on

set backspace=indent,eol,start
set wrap
set ttimeout
set ttimeoutlen=1
set ttyfast
set lazyredraw
set encoding=utf-8

noremap y "+y
noremap Y "+Y
noremap yy "+yy

inoremap { {}<Left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {{ {
inoremap {} {}

inoremap [ []<Left>
inoremap [] []

inoremap ( ()<Left>
inoremap () ()

nnoremap c( di(
nnoremap c{ di{
nnoremap c[ di[
nnoremap <Esc> :nohlsearch<CR>


" Cursor
if has('nvim')
  set guicursor=n-v-c-sm:block-blinkon100,i-ci-ve:ver25-blinkon100,r-cr-o:hor20-blinkon100
else
  if $TERM_PROGRAM ==# 'iTerm.app'
    let &t_SI = "\<Esc>]50;CursorShape=1;BlinkingCursorEnabled=1\x7"
    let &t_SR = "\<Esc>]50;CursorShape=2;BlinkingCursorEnabled=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0;BlinkingCursorEnabled=1\x7"
    " Initialize cursor shape/color on startup
    augroup reset_iTerm_cursor_shape
    au!
    "autocmd VimEnter * startinsert | stopinsert
    autocmd VimEnter * normal! :startinsert :stopinsert
    "autocmd VimEnter * :normal :startinsert :stopinsert
    autocmd VimEnter * redraw!
    augroup END
  else
    let &t_SI .= "\e[5 q" " SI = INSERT mode
    let &t_SR .= "\e[3 q" " SR = REPLACE mode
    let &t_EI .= "\e[1 q" " EI = NORMAL mode (ELSE)
    " Initialize cursor shape/color on startup
    augroup reset_cursor_shape
    au!
    "autocmd VimEnter * startinsert | stopinsert
    autocmd VimEnter * normal! :startinsert :stopinsert
    "autocmd VimEnter * :normal :startinsert :stopinsert
    autocmd VimEnter * redraw!
    augroup END
    " Reset cursor when Vim exits:
    autocmd VimLeave * silent !echo -ne "\e[5 q"
  endif
endif
