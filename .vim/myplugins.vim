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
" NOTE : help mucomplete-compatibility for tab completion issues
Plug 'lifepillar/vim-mucomplete'
set completeopt+=menuone
set completeopt+=noselect
"set completeopt+=noinsert
set shortmess+=c   " Shut off completion messages
set belloff+=ctrlg " If Vim beeps during completion
let g:mucomplete#enable_auto_at_startup = 1
" delay in miliiseconds before autocomplete starts
let g:mucomplete#completion_delay = 200
highlight Pmenu ctermbg=blue guibg=gray

if has('nvim')
  """"""""""""""""" colorschemes """""""""""""""""""""
  set termguicolors     " enable true colors support
  Plug 'ayu-theme/ayu-vim' " or other package manager
  let ayucolor="light"  " for light version of theme
  let ayucolor="mirage" " for mirage version of theme
  let ayucolor="dark"   " for dark version of theme
  " colorscheme ayu

  Plug 'morhetz/gruvbox'
  Plug 'joshdick/onedark.vim'
  Plug 'rakr/vim-one'
  Plug 'flazz/vim-colorschemes'
  """"""""""""""""" colorschemes """""""""""""""""""""

  " live preview the :substitute command
  set inccommand=nosplit
  Plug 'HerringtonDarkholme/yats.vim'  "required for typescript-vim
  " pip3 install neovim - required for deoplete
  Plug 'Shougo/deoplete.nvim'
  let g:deoplete#enable_at_startup = 1
  Plug 'Shougo/neco-syntax'
  " vim command autocomplete
  Plug 'Shougo/neco-vim'
  Plug 'Shougo/neoyank.vim'
  Plug 'deoplete-plugins/deoplete-zsh'

  " FIXME : does not work
  " Plug 'stamblerre/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }

  " FIXME : does not work
  " Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

  " let g:go_disable_autoinstall = 1
  " let g:go_fmt_autosave = 1
  " let g:go_bin_path = expand("$HOME/.gvm/pkgsets/go1.2.1/global/bin/")
  " Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}

  " deoplete source for typescript
  " disabled since this shows too much information on each line of react and
  " can be distracting
  let g:nvim_typescript#type_info_on_hold=0
  "FIXME disable in favor of echodo once that starts working
  let g:nvim_typescript#signature_complete=0
  let g:nvim_typescript#default_mappings=1
  let g:nvim_typescript#javascript_support=0
  "NOTE : need to run 'npm start' in the root dir
  " Plug 'mhartington/nvim-typescript', {'do': './install.sh'}

  "fix some lint errors
  " TODO does not work
  " Plug 'Quramy/tsuquyomi'

  " Plug 'vim-scripts/SyntaxComplete'
  " if has("autocmd") && exists("+omnifunc")
  "   autocmd Filetype *
  "         \	if &omnifunc == "" |
  "         \		setlocal omnifunc=syntaxcomplete#Complete |
  "         \	endif
  " endif
  " TODO Plug 'jsfaint/gen_tags.vim'
  " TODO : https://bluz71.github.io/2019/03/11/find-replace-helpers-for-vim.html

  Plug 'Shougo/context_filetype.vim' "used by echodoc
  " FIXME not working
  let g:echodoc#enable_at_startup = 1
  Plug 'Shougo/echodoc.vim'
  set cmdheight=2

  " NOTE: install at root dir of project : npm i javascript-typescript-langserver
  Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
  " Required for operations modifying multiple buffers like rename.
  set hidden

  " on command line :
  " nvim +PlugInstall +UpdateRemotePlugs +qa
  let g:LanguageClient_serverCommands = {
        \ 'javascript': ['tcp://127.0.0.1:2089'],
        \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
        \ 'typescript': ['javascript-typescript-stdio'],
        \ 'typescript.tsx': ['javascript-typescript-stdio'],
        \ 'go': ['go-langserver']
        \ }
  " NOTE : enable for debugging
  " let g:LanguageClient_loggingLevel = 'INFO'
  " let g:LanguageClient_loggingFile = '/tmp/LanguageClient.log'
  " let g:LanguageClient_serverStderr = '/tmp/LanguageServer.log'
  let g:LanguageClient_autoStart = 1

  if executable('javascript-typescript-stdio')
    let g:LanguageClient_serverCommands.javascript = ['javascript-typescript-stdio']
    " Use LanguageServer for omnifunc completion
    autocmd FileType javascript setlocal omnifunc=LanguageClient#complete
    autocmd FileType typescript setlocal omnifunc=LanguageClient#complete
  else
    echo "javascript-typescript-stdio not installed!\n"
    :cq
  endif
  nnoremap <F5> :call LanguageClient_contextMenu()<CR>
  " Or map each action separately
  nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
  nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
  nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
else
  "https://drivy.engineering/setting-up-vim-for-react/
  "linting
  "" Enable completion where available.
  " This setting must be set before ALE is loaded.
  let g:ale_completion_enabled = 1
  " " let g:ale_set_balloons = 1
  Plug 'w0rp/ale'
  " " FIXME : This seems to start brakeman going in rails, so only enabling for
  " " javascrip
  let g:ale_linters = {
        \   'javascript': ['eslint'],
        \   'css': ['eslint'],
        \}
  " " Set this. Airline will handle the rest.
  " let g:airline#extensions#ale#enabled = 1
  " " Set this in your vimrc file to disabling highlighting
  let g:ale_set_highlights = 0
  let g:ale_sign_column_always = 1
  " Here’s how to install ESLint:"
  "yarn add --dev eslint babel-eslint eslint-plugin-react
  " and then configure it by runnning:
  "eslint --init

  "navigate between errors quickly
  nmap <silent> <C-k> <Plug>(ale_previous_wrap)
  nmap <silent> <C-j> <Plug>(ale_next_wrap)
  let g:ale_pattern_options = {
        \ '\.rb$': {'ale_linters': ['rails_best_practices', 'reek', 'rubocop', 'standardrb', 'solargraph'], 'ale_fixers': ['rails_best_practices']},
        \}
endif

" Keep, Reject, Restore within quick fix window
Plug 'romainl/vim-qf'

Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/1.x',
  \ 'for': [
    \ 'javascript',
    \ 'typescript',
    \ 'css',
    \ 'less',
    \ 'scss',
    \ 'json',
    \ 'graphql',
    \ 'markdown',
    \ 'vue',
    \ 'lua',
    \ 'php',
    \ 'python',
    \ 'ruby',
    \ 'html',
    \ 'swift' ] }

" > q : next error
" < q : previous error
Plug 'tpope/vim-unimpaired'
nmap < [
nmap > ]
omap < [
omap > ]
xmap < [
xmap > ]
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

Plug 'itchyny/lightline.vim'
let g:lightline = {
       \ 'component_function': {
       \   'filename': 'LightLineFilename',
       \   'gitbranch': 'fugitive#head',
       \ },
       \ 'active': {
       \   'left': [ [ 'mode', 'paste', 'spell' ],
       \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
       \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
       \ },
       \ }


function! LightLineFilename()
  return expand('%')
endfunction

"to change it to 'Hello world!'
"Now press cs'<q> to change it to <q>Hello world!</q>
" cs, ds
Plug 'tpope/vim-surround'
" ghetto HTML/XML mappings enhances surround
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'adelarsq/vim-matchit'
"am/im to select between matchit sections
Plug 'machakann/vim-highlightedyank'

" text objects
"var / vir to select between def / end
Plug 'rhysd/vim-textobj-ruby'
Plug 'adriaanzon/vim-textobj-matchit'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-function'
Plug 'haya14busa/vim-textobj-function-syntax'
Plug 'vim-scripts/argtextobj.vim' " Function arguments as text objects: ia, aa
" <count>ai	An Indentation level and line above.
" <count>ii	Inner Indentation level (no line above).
" <count>aI	An Indentation level and lines above/below.
" <count>iI	Inner Indentation level (no lines above/below).
Plug 'michaeljsmith/vim-indent-object'
" TODO try these snippets out
" Plug 'mlaursen/vim-react-snippets'
" https://vimawesome.com/plugin/vim-react-snippets
" Track the engine.
" FIXME how to use this ??
"   http://vimcasts.org/episodes/meet-ultisnips/
"   http://vimcasts.org/episodes/ultisnips-visual-placeholder/
" Plug 'SirVer/ultisnips'
" NOTE : interferes with auto complete plugin with default settings
" let g:UltiSnipsExpandTrigger = "<c-l>"        " Do not use <tab>
" let g:UltiSnipsJumpForwardTrigger = "<c-b>"  " Do not use <c-j>
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

" Currently, es6 version of snippets is available in es6 branch only
Plug 'letientai299/vim-react-snippets', { 'branch': 'es6' }
Plug 'honza/vim-snippets' "optional
" ES2015 code snippets
Plug 'epilande/vim-es2015-snippets'
" TODO :
" Plug 'mattn/emmet-vim'
" let g:user_emmet_expandabbr_key = '<C-a>,'


"use ripgrep inside vim
":Rg <string|pattern>
":RgRoot -- show root dir
Plug 'jremmen/vim-ripgrep'

Plug 'Yggdroot/indentLine'
let g:indentLine_char = '⎸'

Plug 'christoomey/vim-tmux-navigator'
Plug 'easymotion/vim-easymotion'

Plug 'aserebryakov/vim-todo-lists'

"ruby
Plug 'tpope/vim-endwise'

"fzf fuzzy searching
" PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run the install script
" If you already installed fzf using Homebrew, the following should suffice:
set rtp+=/usr/local/opt/fzf
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Plug 'skywind3000/asyncrun.vim'
" autocmd BufWritePost *.js AsyncRun -post=checktime ~/node_modules/.bin/eslint --fix %
" Initialize plugin system

"json highlighter
autocmd FileType json syntax match Comment +\/\/.\+$+

" Syntax highlighter plugins
" Plug 'sheerun/vim-polyglot'
Plug 'kchmck/vim-coffee-script'
" Plug 'pangloss/vim-javascript'
" Plug 'jelera/vim-javascript-syntax'

" format jsx code
" Plug 'mxw/vim-jsx'

Plug 'pangloss/vim-javascript'
Plug 'jason0x43/vim-js-indent'
" Plug 'bigfish/vim-js-context-coloring'
" let g:js_context_colors_enabled=1
 " NOTE: assumes that you are using some other javascript plugin for syntax highlighting and it attaches itself onto
 " the JavaScriptAll cluster. So put this after vim-js-context-coloring
Plug 'glanotte/vim-jasmine'

" NOTE this causes issue with nvim-typescript
" Plug 'MaxMEllon/vim-jsx-pretty'
" default 0
let g:vim_jsx_pretty_colorful_config = 1
Plug 'leafgarland/typescript-vim'
" NOTE depends on leafgarland/typescript-vim
Plug 'peitalin/vim-jsx-typescript'
" change syntax highlight colors based on here : https://vimawesome.com/plugin/vim-jsx-typescript
" TODO : https://vimawesome.com/plugin/vim-babel
" TODO : ctags auto update : https://tbaggery.com/2011/08/08/effortless-ctags-with-git.html

" session management, auto file save
Plug 'thaerkh/vim-workspace'
"session workspace plugin
let g:workspace_session_directory = $HOME . '/.vim/sessions/'
"let g:workspace_undodir='~/.undodir'
let g:workspace_autosave_always = 1
let g:workspace_session_disable_on_args = 1
let g:workspace_autocreate = 1
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

"allows * and # searches to occur on the current visual selection.
Plug 'nelstrom/vim-visual-star-search'

Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
let NERDTreeHijackNetrw = 0
noremap <silent> <leader>n :NERDTreeToggle<CR> <C-w>=
noremap <silent> <leader>N :NERDTreeFind<CR> <C-w>=
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
let g:NERDTreeUpdateOnCursorHold = 0
let g:NERDTreeUpdateOnWrite      = 0

Plug 'janko-m/vim-test'
let test#javascript#jest#executable = 'CI=true yarn test --colors'
nnoremap <silent> <leader>tt :TestNearest<CR>
nnoremap <silent> <leader>tf :TestFile<CR>
nnoremap <silent> <leader>ts :TestSuite<CR>
nnoremap <silent> <leader>tl :TestLast<CR>
if has("nvim")
  let test#strategy = "neovim"
else
  let test#strategy = "vimterminal"
endif

" brew install uptech/oss/alt
" Run a given vim command on the results of alt from a given path.
" See usage below.
function! AltCommand(path, vim_command)
  let l:alternate = system("alt " . a:path)
  if empty(l:alternate)
    echo "No alternate file for " . a:path . " exists!"
  else
    exec a:vim_command . " " . l:alternate
  endif
endfunction

" Find the alternate file for the current path and open it
nnoremap <leader>. :w<cr>:call AltCommand(expand('%'), ':e')<cr>)

" automatically adjusts shiftwidth and expandtab intelligently based on the existing indentation
Plug 'tpope/vim-sleuth'
" FIXME not working
" Plug 'szw/vim-g'

Plug 'JamshedVesuna/vim-markdown-preview'

call plug#end()
" NOTE: Reload .vimrc and :PlugInstall to install plugins.
