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
"

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" NOTE Make sure you use single quotes

" ruby / rails plugins
Plug 'https://github.com/tpope/vim-rails.git'
"Plug 'https://github.com/tpope/vim-rbenv.git'
Plug 'https://github.com/tpope/vim-bundler.git'
Plug 'https://github.com/tpope/vim-rake.git'
Plug 'https://github.com/kchmck/vim-coffee-script.git'

" Plug 'https://github.com/vim-scripts/vim-auto-save.git'
" sensible defaults
" NOTE : disabled since it seems to interfere with my settings
"Plug 'https://github.com/tpope/vim-sensible.git'

" Plug 'https://github.com/mxw/vim-jsx.git'
" Plug 'https://github.com/MaxMEllon/vim-jsx-pretty.git'
" Plug 'https://github.com/leafgarland/typescript-vim'
" Plug 'https://github.com/pangloss/vim-javascript.git'
" Plug 'https://github.com/mattn/emmet-vim.git'

" Git support
" http://vimcasts.org/episodes/fugitive-vim---a-complement-to-command-line-git/
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/airblade/vim-gitgutter.git'

"to change it to 'Hello world!'
"Now press cs'<q> to change it to <q>Hello world!</q>
" cs, ds
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'https://github.com/tpope/vim-repeat.git'
Plug 'https://github.com/adelarsq/vim-matchit.git'

" comment code : use gc
Plug 'https://github.com/tpope/vim-commentary.git'

"Plug 'https://github.com/vim-airline/vim-airline.git'
"Plug 'https://github.com/vim-airline/vim-airline-themes.git'

Plug 'https://github.com/thoughtbot/vim-rspec.git'
Plug 'https://github.com/tpope/vim-dispatch.git'

" session management, auto file save
Plug 'https://github.com/thaerkh/vim-workspace.git'

"fzf fuzzy searching
" PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run the install script
Plug 'https://github.com/junegunn/fzf.git', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'https://github.com/junegunn/fzf.vim.git'
" Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
" Both options are optional. You don't have to install fzf in ~/.fzf
" and you don't have to run the install script if you use fzf only in Vim.

" FIXME : no worky :-(
"Plug 'https://github.com/kien/rainbow_parentheses.vim.git'

Plug 'https://github.com/junegunn/vim-easy-align.git'

" ctags plugin
" Tried it out but not doing the right thing for ruby files
" Plug 'https://github.com/Valloric/YouCompleteMe.git'
"auto complete from opened buffers
Plug 'https://github.com/ervandew/supertab.git'
" Plug 'https://github.com/ludovicchabant/vim-gutentags.git'

"use ripgrep inside vim
":Rg <string|pattern>
":RgRoot -- show root dir
Plug 'https://github.com/jremmen/vim-ripgrep.git'

Plug 'https://github.com/Yggdroot/indentLine.git'

Plug 'https://github.com/christoomey/vim-tmux-navigator.git'

Plug 'https://github.com/aserebryakov/vim-todo-lists.git'

Plug 'https://github.com/tpope/vim-endwise.git'

"linting
Plug 'https://github.com/w0rp/ale.git'
" Here’s how to install ESLint:"
"yarn add --dev eslint babel-eslint eslint-plugin-react
" and then configure it by runnning:
"eslint --init

" Initialize plugin system
call plug#end()
" NOTE: Reload .vimrc and :PlugInstall to install plugins.

" ============== Plugin related settings ====================
"auto save files
"https://vimawesome.com/plugin/vim-auto-save
" let g:auto_save = 1  " enable AutoSave on Vim startup
" let g:auto_save_silent = 1  " do not display the auto-save notification
" let g:auto_save_in_insert_mode = 0  " do not save while in insert mode

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

"CtrP fuzzy find files
"http://ctrlpvim.github.io/ctrlp.vim/#installation
"set runtimepath^=~/.vim/bundle/ctrlp.vim

let g:airline#extensions#tabline#enabled = 1

"session workspace plugin
let g:workspace_session_directory = $HOME . '/.vim/sessions/'
" let g:workspace_undodir='~/.undodir'

let g:workspace_autosave_always = 1
let g:workspace_session_disable_on_args = 1

"rainbow_parentheses
" No worky
" au VimEnter * RainbowParenthesesToggle
" au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces

"indentLine
let g:indentLine_char = '⎸'

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

" jsx
let g:vim_jsx_pretty_colorful_config = 1 " default 0
" emmet
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}


" map ctrl-p to fzf search
nnoremap <C-p> :Files<Cr>
