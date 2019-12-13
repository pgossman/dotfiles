set nocompatible              " be iMproved, required

"Install vim-plug if we ain't got it
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ycm-core/YouCompleteMe'
Plug 'scrooloose/nerdcommenter'
Plug 'sbdchd/neoformat'

call plug#end()

let mapleader = ","

syntax on
set number
colorscheme default

set tabstop=4 " show existing tab with 4 spaces width
set shiftwidth=4 " when indenting with '>', use 4 spaces width
set expandtab " On pressing tab, insert 4 spaces

nnoremap <space><space> :nohlsearch<CR>

"""""""""
" OCaml
"""""""""
"/Users/pgossman/.opam/4.06.1/share/merlin
nnoremap ,t :MerlinTypeOf<CR>
nnoremap ,f :MerlinLocate<CR>
augroup ocaml
    autocmd!
    autocmd BufWritePre *.ml Neoformat
augroup END


"""""""""
" Fzf
"""""""""
nnoremap ,<space> :Buffers<CR>
nnoremap ,b :Commands<CR>
nnoremap ,n :Files<CR>
nnoremap ,a :Rg<CR>


"""""""""
" splits
"""""""""
nnoremap <C-l> <C-w><C-l>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-h> <C-w><C-h>

"""""""""
" vimrc
"""""""""
nnoremap ,vv :e ~/.vimrc<CR>
augroup vimrc     " Source vim configuration upon save
    autocmd! BufWritePost $MYVIMRC source % | redraw
augroup END
