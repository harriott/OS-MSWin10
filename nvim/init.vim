" vim: set fdl=1:

" -------------------------
" configurations for neovim
" -------------------------

" $MSWin10\init.vim  ($MSwin10\mb\symlinks.ps1)

""> 0 pull in Vim configuration
" share my gVim configuration
" if has('win32')
  set runtimepath^=~\vimfiles " at start
  set runtimepath+=~\vimfiles\after  " at end
  source ~\_vimrc  " $MSWin10/mb/_vimrc-AZERTY
" endif
let &packpath = &runtimepath

""> 1 colours
" for accurate colour codes
set termguicolors
" can turn off with :se notgc

if has('unix')
  " let g:Hexokinase_highlighters = ['foregroundfull']
  packadd vim-hexokinase
endif

