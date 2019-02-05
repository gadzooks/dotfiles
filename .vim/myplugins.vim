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

" Plug 'https://github.com/vim-scripts/vim-auto-save.git'
" sensible defaults
" NOTE : disabled since it seems to interfere with my settings
"Plug 'https://github.com/tpope/vim-sensible.git'

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

" session management, auto file save
Plug 'https://github.com/thaerkh/vim-workspace.git'

"fzf fuzzy searching
" PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run the install script
Plug 'https://github.com/junegunn/fzf.git', { 'dir': '~/.fzf', 'do': './install --all' }
" Both options are optional. You don't have to install fzf in ~/.fzf
" and you don't have to run the install script if you use fzf only in Vim.

" FIXME : no worky :-(
"Plug 'https://github.com/kien/rainbow_parentheses.vim.git'

Plug 'https://github.com/junegunn/vim-easy-align.git'

" Initialize plugin system
call plug#end()
" Reload .vimrc and :PlugInstall to install plugins.

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

" ctags
set tags=tags;/

"CtrP fuzzy find files
"http://ctrlpvim.github.io/ctrlp.vim/#installation
"set runtimepath^=~/.vim/bundle/ctrlp.vim

let g:airline#extensions#tabline#enabled = 1

"session workspace plugin
let g:workspace_session_directory = $HOME . '/.vim/sessions/'
let g:workspace_autosave_always = 1
let g:workspace_autosave_ignore = ['gitcommit']
"If you would prefer that a session is automatically created if it doesn't exist,
"you can add the following line to enable the behaviour:
let g:workspace_autocreate =1

"rainbow_parentheses
" No worky
" au VimEnter * RainbowParenthesesToggle
" au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces
