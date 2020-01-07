set nocompatible  " be iMproved, required

let mapleader = ","

syntax on
set number
colorscheme default

set tabstop=4 " show existing tab with 4 spaces width
set shiftwidth=4 " when indenting with '>', use 4 spaces width
set expandtab " On pressing tab, insert 4 spaces
set fileformat=unix

set hlsearch
set incsearch
nnoremap <space><space> :nohlsearch<CR>


"""""""""""""""
" Plugins
"""""""""""""""
"Install vim-plug if we ain't got it
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ycm-core/YouCompleteMe'
Plug 'scrooloose/nerdcommenter'
Plug 'sbdchd/neoformat'  " Multi-language formatter
Plug 'psf/black'  " Python Black formatter
Plug 'SirVer/ultisnips'  " Snippet engine
Plug 'honza/vim-snippets'  " Some actual snippets
call plug#end()

let g:UltiSnipsExpandTrigger="<S-Tab>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"


"""""""""""""""
" OCaml
"""""""""""""""
nnoremap ,t :MerlinTypeOf<CR>
nnoremap ,f :MerlinLocate<CR>
augroup ocaml
    autocmd!
    autocmd BufWritePre *.ml Neoformat
augroup END

let g:neoformat_ocaml_ocamlformat = {
            \ 'exe': 'ocamlformat',
            \ 'no_append': 1,
            \ 'stdin': 1,
            \ 'args': ['--enable-outside-detected-project', '--profile', 'janestreet', '--name', '"%:p"', '-']
            \ }
let g:neoformat_enabled_ocaml = ['ocamlformat']

"""""""""""""""
" Python
"""""""""""""""
nnoremap ,f :MerlinLocate<CR>
augroup pytn
    autocmd!
    autocmd BufWritePre *.py Black
augroup END


"""""""""""""""
" Fzf
"""""""""""""""
nnoremap ,<space> :Buffers<CR>
nnoremap ,b :Commands<CR>
nnoremap ,n :Files<CR>
nnoremap ,a :Rg<CR>


"""""""""""""""
" splits
"""""""""""""""
nnoremap <C-l> <C-w><C-l>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-h> <C-w><C-h>

"""""""""""""""
" vimrc
"""""""""""""""
nnoremap ,vv :e ~/.vimrc<CR>
augroup vimrc     " Source vim configuration upon save
    autocmd! BufWritePost $MYVIMRC source % | redraw
augroup END


" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
" ## added by OPAM user-setup for vim / ocp-indent ## 04adec492ede3739fe2c4ca09e4ca7c6 ## you can edit, but keep this line
if count(s:opam_available_tools,"ocp-indent") == 0
  source "/home/paul/.opam/4.07.1/share/ocp-indent/vim/indent/ocaml.vim"
endif
" ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line
