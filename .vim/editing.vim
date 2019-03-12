"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OmniCompletion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" " Enable OmniCompletion for Ruby
autocmd FileType ruby set omnifunc=rubycomplete#Complete
" " ... and Rails
" autocmd FileType ruby let g:rubycomplete_rails = 1
" " ... and to include Classes in global completions
" autocmd FileType ruby let g:rubycomplete_classes_in_global = 1

" autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
set omnifunc=syntaxcomplete#Complete
