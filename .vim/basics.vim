" Set default encoding to UTF-8.
set encoding=utf-8

" set nobackup                    " Don't keep a backup file
" set writebackup                 " … but do keep a backup file during writes
" set directory-=.                " Don't store swapfiles in the current directory

" set noswapfile
set backup
set backupdir=/tmp/backups
set directory=/tmp/backups
syntax on
filetype plugin indent on
filetype plugin on

" Useful for :find command
set path+=**

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

" ================ Scrolling ========================
"Start scrolling when we're 8 lines away from margins
set scrolloff=8         
set sidescrolloff=15
set sidescroll=1
set mouse=a

" ================ Completion =======================
"When more than one match, list all matches and
"complete first match.
set wildmode=list:full
                            
set wildmenu
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
set complete=.,b,u,]            " Pull from keywords for completion in the current file, other buffers (closed or still open), and from the current tags file.
set suffixes+=.old              " set of file name suffixes that will be given a lower priority when it comes to matching wildcards


" automatically delete empty space at end of lines
autocmd BufWritePre *.haml %s/\s\+$//e
autocmd BufWritePre *.rb %s/\s\+$//e
autocmd BufWritePre *.js %s/\s\+$//e

set showcmd

set cursorline

set number
set relativenumber                " relative line numbers! How cool is that?!
set numberwidth=3               " How many columns to use for the line number

set autowrite                   " Automatically :write before running commands
set autoread                    " Automatically read file changed outside of vim
set tildeop                     " Make ~ work like a normal operator
set gdefault                    " always apply substitutions globally on a line
set viminfo+=!                  " make sure it can save viminfo
set fileformats=unix,dos,mac    " support all three, in this order
set iskeyword+=_,$,@,%,#,-      " none of these should be word dividers, so make them not be
set title                       " show title in xterm

" Show absolute line numbers in insert mode, relative line numbers otherwise
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Sane searching
set hlsearch                    " Hilight search term
set showmatch                   " Show matching brackets
set incsearch                   " Do incremental searching
set ignorecase
set smartcase
" clear search highlight
nnoremap <leader><space> :noh<cr>

" turn off highlighting when esc is pressed
" FIXME : this starts vim in REPLACE mode.
 " nnoremap <esc> :noh<return><esc>

" spelling
set spelllang=en
setlocal spell
hi clear SpellBad
hi SpellBad cterm=underline

" This line will make Vim set out tab characters, trailing whitespace and
" invisible spaces visually, and additionally use the # sign at the end of
" lines to mark lines that extend off-screen. For more info, see :h listchars.
set list
set listchars=extends:»,precedes:«,tab:▸\

" save undo information
set undodir=$HOME/.vim-undo
set undofile
set undolevels=1000
set undoreload=10000

set laststatus=2
set ruler

if v:version > 703 || v:version == 703 && has("patch541")
  " Delete comment character when joining commented lines
  set formatoptions+=j 
endif

" status line
" set statusline+=%f\ %2*%m\ %1*%h
" set statusline+=%#warningmsg#
" set statusline+=%{fugitive#statusline()}
" set statusline+=%* set statusline+=%r%=[%{&encoding}\ %{&fileformat}\ %{strlen(&ft)?&ft:'none'}]\ %12.(%c:%l/%L%)

" tag support
set tags=./tags;
command! MakeTags !ctags -R .

" file for autosaved session
let g:ausession=".vimsession"

" change background color after 80th column and 120th column
highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn=join(range(81,999),",")
let &colorcolumn="80,".join(range(120,999),",")

" automatically set paste when pasting and then disable afterwards
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction
