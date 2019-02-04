" ================ Indentation ======================

" install vim-plug before anything else
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" NOTE Make sure you use single quotes

" ruby / rails plugins
Plug 'https://github.com/tpope/vim-rails.git'
"Plug 'https://github.com/tpope/vim-rbenv.git'

Plug 'https://github.com/vim-scripts/vim-auto-save.git'
" sensible defaults
Plug 'https://github.com/tpope/vim-sensible.git'

" Git support
" http://vimcasts.org/episodes/fugitive-vim---a-complement-to-command-line-git/
Plug 'https://github.com/tpope/vim-fugitive.git'

"to change it to 'Hello world!'
"Now press cs'<q> to change it to <q>Hello world!</q>
" cs, ds
Plug 'https://github.com/tpope/vim-surround.git'

" comment code : use gc
Plug 'https://github.com/tpope/vim-commentary.git'

"Plug 'https://github.com/vim-airline/vim-airline.git'
"Plug 'https://github.com/vim-airline/vim-airline-themes.git'

Plug 'https://github.com/thoughtbot/vim-rspec.git'

" Initialize plugin system
call plug#end()
" Reload .vimrc and :PlugInstall to install plugins.

" ============== Plugin related settings ====================
"auto save files
"https://vimawesome.com/plugin/vim-auto-save
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_silent = 1  " do not display the auto-save notification
let g:auto_save_in_insert_mode = 0  " do not save while in insert mode

":A to jump to spec not test
"https://github.com/tpope/vim-rails/issues/426
let g:rails_projections = {
      \  'app/*.rb': {
      \     'alternate': 'spec/{}_spec.rb',
      \     'type': 'source'
      \   },
      \  'spec/*_spec.rb': {
      \     'alternate': 'app/{}.rb',
      \     'type': 'test'
      \   }
      \}

let mapleader = "\\"

" ctags
set tags=tags;/

"CtrP fuzzy find files
"http://ctrlpvim.github.io/ctrlp.vim/#installation
"set runtimepath^=~/.vim/bundle/ctrlp.vim

let g:airline#extensions#tabline#enabled = 1

"vim-rpsec
" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" ================ Plugin installation  ======================

set noswapfile
syntax on
filetype plugin indent on
filetype plugin on

" Useful for :find command
set path+=**

set number
set relativenumber			" relative line numbers! How cool is that?!

" Move up/down editor lines
nnoremap j gj
nnoremap k gk
nnoremap ii <Esc>

" Visualize tabs and newlines
set list
set listchars=tab:▸\

" ================ Indentation ======================
set autoindent
set expandtab
set expandtab
set formatoptions=tcqrn1
set noshiftround
set shiftwidth=2
set smartindent
set smarttab
set softtabstop=2
set tabstop=2
set textwidth=79
set wrap

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1
set mouse=a

set ignorecase
set smartcase

" automatically delete empty space at end of lines
autocmd BufWritePre *.haml %s/\s\+$//e
autocmd BufWritePre *.rb %s/\s\+$//e
autocmd BufWritePre *.js %s/\s\+$//e


