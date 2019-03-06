# learn vim
- leader is ,

## vim basics
- * will search word under cursor
- g, : last edited place in file
- g; : next edited place in file
- zo : open current fold
- zc : close current fold
- zM : close all folds
- zR : open all folds
- :only : close all other buffers

## windows
- C-w = : make split windows equal size
- C-w-r = : swap windows
- C-w-<CR> = : open quick fix result in new split window

## fzf search
ctrl-X open buffer in split
ctrl-v open buffer in v-split 
- <Leader> <SPACE> : clear search highlight
- <Leader> f : search all git tracked files
- <Leader> F : search all tracked files
- <Leader> b : search all buffers
- <Leader> h : search all history
- <Leader> T : search all tags in current class
- <Leader> t : search all tags in whole code base

- <Leader> l : search current buffer
- <Leader> L : search all buffer

- <Leader> s : search in file names and files, follow gitignore
- <Leader> S : search inside all files, filenames etc
- <Leader> a : RipGrep

- <Leader> H : search vim help

- <Leader> ; : search command history
- <Leader> / : search through /search history

## git
- <leader> gs : Gstatus
- <Leader> g : commits for this file
- <Leader> G : commits for this project
- Gread : git checkout -- %
- Gblame : git blame
- Gmove : does git move and updates buffer
- Gbrowse : browse file in browser
-

## fugitive related

## surround
- ds : de-surround
- cs : surround

##matchit
- use %

## textobj
- m - method / block, M - module class
- use var - select block, ar to increase block and ir to decrease
- use vam / vaM - select block, im(?) to decrease
- cir / car / cim / ciM / caM / ciM = change inside / around ruby block / class / module
- dir / dar = delete inside / around ruby block
- 

## vim snippets
- TODO

## todo
- vim-unimpaireda
- https://github.com/b4b4r07/enhancd

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
