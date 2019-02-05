" Move up/down editor lines
" Make j and k behave more natural when working with long, wrapped lines
nnoremap j gj
nnoremap k gk
nnoremap ii <Esc>


" turn off highlighting when esc is pressed
" FIXME : this starts vim in REPLACE mode.
 " nnoremap <esc> :noh<return><esc>

 " Swap v and CTRL-V, because Block mode is more useful that Visual mode
nnoremap    v   <C-V>
nnoremap <C-V>     v

vnoremap    v   <C-V>
vnoremap <C-V>     v


" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

"vim-rpsec
" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ARROW KEYS ARE UNACCEPTABLE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <Left>  :echoe "Use h!"<CR>
map <Right> :echoe "Use l!"<CR>
map <Up>    :echoe "Use k!"<CR>
map <Down>  :echoe "Use j!"<CR>
