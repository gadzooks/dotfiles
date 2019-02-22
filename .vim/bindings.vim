
" Move up/down editor lines
" Make j and k behave more natural when working with long, wrapped lines
" FIXME : the j,k and ii mappings seem to slow down movement
" nnoremap j gj
" nnoremap k gk
" nnoremap ii <Esc>

" turn off highlighting when esc is pressed
" FIXME : this starts vim in REPLACE mode.
 " nnoremap <esc> :noh<return><esc>

 " Swap v and CTRL-V, because Block mode is more useful that Visual mode
nnoremap    v   <C-V>
nnoremap <C-V>     v

vnoremap    v   <C-V>
vnoremap <C-V>     v


" Reselect visual block after indent/outdent
" vnoremap < <gv
" vnoremap > >gv

"vim-rpsec
" RSpec.vim mappings
" map <Leader>t :call RunCurrentSpecFile()<CR>
" map <Leader>s :call RunNearestSpec()<CR>
" map <Leader>l :call RunLastSpec()<CR>
" map <Leader>a :call RunAllSpecs()<CR>

"fzf related bindings
" search filenames for files tracked by git
nmap <Leader>f :GFiles<CR>
" search all filenames
nmap <Leader>F :Files<CR>
" search all filenames in buffers
nmap <Leader>b :Buffers<CR>
" search history
nmap <Leader>h :History<CR>
" search tags
nmap <Leader>t :BTags<CR>
nmap <Leader>T :Tags<CR>

" search in current buffer
nmap <Leader>l :BLines<CR>
" search in loaded buffers
nmap <Leader>L :Lines<CR>
" search marks ?
nmap <Leader>' :Marks<CR>

"Fuzzy search defined commands, whether they be user defined, plugin defined, or native commands:
nmap <Leader>C :Commands<CR>

" search vim help
nmap <Leader>H :Helptags!<CR>

" search command history
" nmap <Leader>: :History:<CR>
nmap <Leader>; :History:<CR>
nmap <Leader>/ :History/<CR>

" Fuzzy search key mappings, which is great for checking against current mappings before defining a new one:
nmap <Leader>M :Maps<CR>

" git commits
nmap <Leader>g :BCommits<CR>
nmap <Leader>G :Commits<CR>

" search in project
nmap <Leader>a :Rg<Space>

