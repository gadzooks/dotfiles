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


"Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rake'

" Syntax highlighter plugins
" Plug 'kchmck/vim-coffee-script'
" Plug 'pangloss/vim-javascript'
" Plug 'mxw/vim-jsx'
Plug 'sheerun/vim-polyglot'

" Git support
" http://vimcasts.org/episodes/fugitive-vim---a-complement-to-command-line-git/
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" comment code : use gc
Plug 'tpope/vim-commentary'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
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

" TODO
Plug 'honza/vim-snippets'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Hitting ctrl-_ will initiate a search for the most recent open tag above that is not closed
Plug 'docunext/closetag.vim'
let g:closetag_html_style=1

Plug 'ervandew/supertab'
" Plug 'ludovicchabant/vim-gutentags'

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

"https://drivy.engineering/setting-up-vim-for-react/
"linting
Plug 'w0rp/ale'
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
" Here’s how to install ESLint:"
"yarn add --dev eslint babel-eslint eslint-plugin-react
" and then configure it by runnning:
"eslint --init

"yarn add --dev prettier eslint-config-prettier eslint-plugin-prettier
"
Plug 'skywind3000/asyncrun.vim'
autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %
" Initialize plugin system

"Code Snippets TODO
Plug 'mattn/emmet-vim'
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

" Plug 'MaxMEllon/vim-jsx-pretty'
" let g:vim_jsx_pretty_colorful_config = 1 " default 0

" Plug 'leafgarland/typescript-vim'

"" session management, auto file save
"Plug 'thaerkh/vim-workspace'
""session workspace plugin
"let g:workspace_session_directory = $HOME . '/.vim/sessions/'
"" let g:workspace_undodir='~/.undodir'
"let g:workspace_autosave_always = 1
" let g:workspace_session_disable_on_args = 1

" provides automatic closing of quotes, parenthesis, brackets, etc., 
Plug 'raimondi/delimitmate'

" vim performance/profiling plugin
" https://github.com/bling/minivimrc

call plug#end()
" NOTE: Reload .vimrc and :PlugInstall to install plugins.

" ============== Plugin related settings ====================
" let mapleader = "\\"

"CtrP fuzzy find files
"http://ctrlpvim.github.io/ctrlp.vim/#installation
"set runtimepath^=~/.vim/bundle/ctrlp.vim


""gutentags
"silent !mkdir -p ~/.ctags
"let g:gutentags_cache_dir = '~/.ctags/'
"let g:gutentags_enabled = 1
""tell Vim to only use the current file and ctags when finding keywords:
""https://thoughtbot.com/blog/integrating-vim-into-your-life
"set complete=.,t
"set statusline+=%{gutentags#statusline()}
"let g:gutentags_ctags_exclude = ["*.min.js", "*.min.css", "build", "vendor", ".git", "node_modules", "*.vim/bundle/*"]

" ctags
" set tags=tags;/

" Plug 'vim-scripts/vim-auto-save'
" sensible defaults
" NOTE : disabled since it seems to interfere with my settings
"Plug 'tpope/vim-sensible'

" Tried it out but not doing the right thing for ruby files
" Plug 'Valloric/YouCompleteMe'
"auto complete from opened buffers
" if has('nvim')
"   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"   Plug 'Shougo/deoplete.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif
" let g:deoplete#enable_at_startup = 1

" Plug 'thoughtbot/vim-rspec'
" Plug 'tpope/vim-dispatch'

" Plug 'luochen1990/rainbow'
" let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

" Plug 'junegunn/vim-easy-align'

" Plug 'vim-scripts/LargeFile'
" let g:LargeFile=1500

