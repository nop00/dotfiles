set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

:source ~/dotfiles/.vimrc.common

:set gfn=terminus 

" Utiliser le presse-papiers système
:set clipboard=unnamedplus

" Reformatage auto. des paragraphes pendant la saisie
:au BufEnter /tmp/*.eml set formatoptions+=aw
:au BufEnter /tmp/*.eml set textwidth=72
:au BufEnter /tmp/*.eml :set spell
:au BufEnter /tmp/*.eml :set nofoldenable
