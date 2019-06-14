- javascript debugger
- put line : debugger in file

# `New stuff`
- <Leader> gm : GitMessenger plugin
  -
- ma : nerdtree create file / dir
- md : nerdtree delete file / dir
- <Leader> rn : coc-rename
- <Leader> gd : coc-definition - find all uses for type
- <Leader> gy : coc-type-definition
- <Leader> gr : coc-references - find all uses for type
- <Leader> gi : coc-implementation
- <Leader> qf : fix autofix problem for current line
- <Leader> u : UltiSnipsExpandTrigger
- <Leader><Leader> f : forward search by 1 char
- <Leader><Leader> F : backward search by 1 char
- <Leader><Leader> b : back to particular word
- <Leader><Leader> w : forward to word start
- <C-l> : UltiSnipsExpandTrigger
- <C-b> : UltiSnips jump to next trigger
- Keep, Reject, Restore within quick fix window
- [US] during insert starts from UltiSnips, use <c-l> to expand that
- > c : next error
- < c : previous error
- > q : next error
- < q : previous error
- f : search forward for char

- Delete, Move, Rename, Chmod, Mkdir, Cfind, Clocate

- ga : search current word in current dir
- f<alphabet> : go to first occurence of alphabet
- select with visual block and then use * / # to search for entire selection
- ci" : change inside "
- ca( : change around (
- ct" : change till "
- ii  : select at indentation

- <Leader> tt : TestNearest
- <Leader> tf : TestFile
- <Leader> ts : TestSuite
- <Leader> tl : TestLast
- <Leader> q : toggle last opened buffer
- <Leader> l : search for word in current buffer
- <Leader> L : search for word in all open buffers
- <Leader> g : commits for this file
- <Leader> u : ul for this file
- <Leader> n : NerdTree
- ;;         : close current buffer

- bd          : buffer distroy

- https://github.com/wellle/targets.vim


# learn vim
- leader is ,

## typescrip
Mapping        Action
-------------  --------------
K              :TSDoc
- <Leader> rn : coc-rename
- <Leader> gd : coc-definition - find all uses for type
- <Leader> gy : coc-type-definition
- <Leader> gr : coc-references - find all uses for type
- <Leader> gi : coc-implementation
- <Leader> qf : fix autofix problem for current line
-
## vim basics
- * will search word under cursor
- g, : last edited place in file
- g; : next edited place in file
- zo : open current fold
- zc : close current fold
- zM : close all folds
- zR : open all folds
- :only : close all other buffers
- ga : search current word in current dir

## windows
- C-w = : make split windows equal size
- C-w-r = : swap windows
- C-w-<CR> = : open quick fix result in new split window

## fzf search
ctrl-X open buffer in split
ctrl-v open buffer in v-split 
- <Leader> <SPACE> : clear search highlight
- <Leader> f : search files in all dirs from which vim was launched
- <Leader> F : search all tracked files
- <Leader> b : search all buffers
- <Leader> h : search all history
- <Leader> T : search all tags in current class
- <Leader> t : search all tags in whole code base

- <Leader> F : search all buffer

- <Leader> s : search in file names and files, follow gitignore
- <Leader> S : search inside all files, filenames etc
- <Leader> a : RipGrep

- <Leader> H : search vim help
- <Leader> ; : search command history

## git
- <leader> gs : Gstatus
- <Leader> g : commits for this file
- <Leader> G : commits for this project
- Gread : git checkout -- %
- Gblame : git blame
- Gmove : does git move and updates buffer
- Gbrowse : browse file in browser

## fugitive related

## surround
- ds : de-surround
- cs : surround

##matchit
- use %

## textobj
- m - method / block, M - module class
> - use var - select block, ar to increase block and ir to decrease
- use vam / vaM - select block, im(?) to decrease
- cir / car / cim / ciM / caM / ciM = change inside / around ruby block / class / module
- dir / dar = delete inside / around ruby block
- 

## vim snippets
- TODO
- https://github.com/epilande/vim-es2015-snippets/blob/master/UltiSnips/javascript.snippets
- https://github.com/epilande/vim-react-snippets

## zsh
j - jump to commonly used dirs
jc - jump to child dir
r - repeat last command
r word - repeat last command with word
fc - fix last command in editor & execute
vi ** **<TAB>
cd ** <TAB>
ssh **, unset **, export **, unalias **

## tmux
C-a-z : togger - full size current pane

##
TODO
- https://vimawesome.com/plugin/cmdalias-vim

## FIXME
- after using j/k, ctrl-j/k does not switch tmux panes unless C-a is used
- tmux dont kill tab without confirmation : ctrl-a x ?

## todo
- vim-unimpaired
- https://github.com/b4b4r07/enhancd
Plug 'wellle/targets.vim'

Plug 'rhysd/clever-f.vim'
let g:clever_f_across_no_line = 1
let g:clever_f_fix_key_direction = 1
let g:clever_f_timeout_ms = 3000

Plug 'michaeljsmith/vim-indent-object'

Plug 'tommcdo/vim-lion'
let g:lion_squeeze_spaces = 1

The vim-projectionist plugin, primarily, provides infrastructure to navigate around projects. This plugin is effectively the core of the vim-rails plugin extracted into a standalone plugin.

## todo


