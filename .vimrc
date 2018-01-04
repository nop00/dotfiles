set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin('$HOME/.vim/bundle/')

:source ~/dotfiles/.vimrc.common

:set gfn=xos4\ Terminus\ 12

" Utiliser le presse-papiers système
:set clipboard=unnamedplus

" Reformatage auto. des paragraphes pendant la saisie
:au BufEnter /tmp/*.eml set formatoptions+=aw
:au BufEnter /tmp/*.eml set textwidth=72
:au BufEnter /tmp/*.eml :set spell
:au BufEnter /tmp/*.eml :set nofoldenable

:set termguicolors " Enable true color support.
:let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
:let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
