" NOTE :
" NOTE :
"""""" ""install vim-plug before anything else """""""""""""""""""""
" NOTE :
" NOTE :
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" Usage :
" PlugInstall
" PlugClean
" PlugUpdate
" PlugUpgrade

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" TODO : see more settings here : https://github.com/lifepillar/vim-mucomplete/blob/master/doc/mucomplete.txt
Plug 'lifepillar/vim-mucomplete'
set completeopt+=menuone
set completeopt+=noselect
"set completeopt+=noinsert
set shortmess+=c   " Shut off completion messages
set belloff+=ctrlg " If Vim beeps during completion
let g:mucomplete#enable_auto_at_startup = 1
highlight Pmenu ctermbg=gray guibg=gray

" NOTE Make sure you use single quotes
" ruby / rails plugins
Plug 'tpope/vim-rails'
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


" Syntax highlighter plugins
Plug 'kchmck/vim-coffee-script'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'sheerun/vim-polyglot'
Plug 'leafgarland/typescript-vim'

" Git support
" http://vimcasts.org/episodes/fugitive-vim---a-complement-to-command-line-git/
Plug 'tpope/vim-fugitive'
nnoremap <leader>gs :Gstatus<CR>
" nnoremap <leader>gp :Gpush<CR>
" nnoremap <leader>gw :Gwrite<CR>
"FIXME  set statusline+= %{FugitiveStatusline()}

"Enables :Gbrowse from fugitive.vim to open GitHub URLs.
Plug 'tpope/vim-rhubarb'
let g:github_enterprise_urls = ['https://github.com/NavigatingCancer/navigatingcare-components', 'https://github.com/NavigatingCancer/gc']
Plug 'airblade/vim-gitgutter'

" comment code : use gc
Plug 'tpope/vim-commentary'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='bubblegum'
let g:airline_section_a = ''
let g:airline_section_y = ''
let g:airline_skip_empty_sections = 1

"to change it to 'Hello world!'
"Now press cs'<q> to change it to <q>Hello world!</q>
" cs, ds
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'adelarsq/vim-matchit'
Plug 'kana/vim-textobj-user'
"var / vir to select between def / end
Plug 'rhysd/vim-textobj-ruby'
"am/im to select between matchit sections
Plug 'adriaanzon/vim-textobj-matchit'


"use ripgrep inside vim
":Rg <string|pattern>
":RgRoot -- show root dir
Plug 'jremmen/vim-ripgrep'

Plug 'Yggdroot/indentLine'
let g:indentLine_char = '⎸'

Plug 'christoomey/vim-tmux-navigator'

Plug 'aserebryakov/vim-todo-lists'

"ruby
Plug 'tpope/vim-endwise'

"fzf fuzzy searching
" PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run the install script
" If you already installed fzf using Homebrew, the following should suffice:
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
" " map ctrl-p to fzf search
nnoremap <C-p> :Files<Cr>
" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

Plug 'skywind3000/asyncrun.vim'
autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %
" Initialize plugin system

" Plug 'MaxMEllon/vim-jsx-pretty'
" default 0
" let g:vim_jsx_pretty_colorful_config = 1
" Plug 'leafgarland/typescript-vim'

"" session management, auto file save
Plug 'thaerkh/vim-workspace'
""session workspace plugin
let g:workspace_session_directory = $HOME . '/.vim/sessions/'
"" let g:workspace_undodir='~/.undodir'
let g:workspace_autosave_always = 1
let g:workspace_session_disable_on_args = 1

" provides automatic closing of quotes, parenthesis, brackets, etc.,
Plug 'raimondi/delimitmate'

" Usage:
"     :call CmdAlias('<lhs>', '<rhs>', [flags])
"     or
"     :Alias <lhs> <rhs> [flags]
                                                                             
"     :UnAlias <lhs> ...
"     :Aliases [<lhs> ...]

" Ex:
"     :Alias runtime Runtime
"     :Alias find Find
"     :Aliases
"     :UnAlias find
Plug 'konfekt/vim-alias'


call plug#end()
" NOTE: Reload .vimrc and :PlugInstall to install plugins.
