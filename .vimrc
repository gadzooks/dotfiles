" Use Vim settings, rather then Vi settings (much better!).
" " This must be first, because it changes other options as a side effect.
set nocompatible

" common code that is needed before anything else loads up goes here
let mapleader = ","
" set statusline= ""
filetype plugin indent on
filetype plugin on
syntax on

set t_8b=[48;2;%lu;%lu;%lum
set t_8f=[38;2;%lu;%lu;%lum

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

source $HOME/.vim/myplugins.vim
source $HOME/.vim/basics.vim
source $HOME/.vim/editing.vim
source $HOME/.vim/bindings.vim
source $HOME/.vim/windows.vim
source $HOME/.vim/mycommands.vim

" :call CmdAlias('find','Tags')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load local config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" if filereadable($HOME . "/.vimrc.local")
"  source ~/.vimrc.local
" endif
