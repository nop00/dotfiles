set rtp+=$USERPROFILE/vimfiles/bundle/Vundle.vim
call vundle#begin('$USERPROFILE/vimfiles/bundle/')

:source $USERPROFILE\dotfiles\.vimrc.common

" Mettre la fenêtre à une taille raisonnable
:set lines=65 columns=120

:set gfn=ProggySquareTT:h12:cANSI

" Utiliser le presse-papiers système
:set clipboard=unnamed

" Reformatage auto. des paragraphes pendant la saisie de mails
:au BufEnter *.eml set formatoptions+=aw
:au BufEnter *.eml set textwidth=72

" :au BufEnter *.eml :setlocal spell spelllang=fr
:au BufEnter *.eml :set spell
:au BufEnter *.eml :set nofoldenable

