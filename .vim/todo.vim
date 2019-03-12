" TODO
" Track the engine.
" Plug 'honza/vim-snippets'
" " Trigger configuration. NOTE: Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" " If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

" " Hitting ctrl-_ will initiate a search for the most recent open tag above that is not closed
" Plug 'docunext/closetag.vim'
" let g:closetag_html_style=1

" Plug 'ervandew/supertab'
" Plug 'ludovicchabant/vim-gutentags'


"yarn add --dev prettier eslint-config-prettier eslint-plugin-prettier

"https://github.com/tpope/vim-unimpaired TODO : check out sometime
"FIXME : <Tab> is reserved for mucomplete
" Plug 'mattn/emmet-vim'
" let g:user_emmet_leader_key='<Tab>'
" let g:user_emmet_settings = {
"   \  'javascript.jsx' : {
"     \      'extends' : 'jsx',
"     \  },
"   \}

" Plug 'flazz/vim-colorschemes'

" vim performance/profiling plugin
" https://github.com/bling/minivimrc

" Plug 'thoughtbot/vim-rspec'
" Plug 'tpope/vim-dispatch'

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

" Plug 'luochen1990/rainbow'
"0 if you want to enable it later via :RainbowToggle
" let g:rainbow_active = 1

" Plug 'junegunn/vim-easy-align'

" Plug 'vim-scripts/LargeFile'
" let g:LargeFile=1500

"Plug 'tpope/vim-rbenv'
" Plug 'tpope/vim-bundler'
" Plug 'tpope/vim-rake'

