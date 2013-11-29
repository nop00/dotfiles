set rtp+=C:\Users\mth\vimfiles\bundle\vundle
call vundle#rc("C:\\Users\\mth\\vimfiles\\bundle")

:source C:\Users\mth\.vimrc.common

:set gfn=ProggySquareTT:h12:cANSI

" Utiliser le presse-papiers système
:set clipboard=unnamed

" Reformatage auto. des paragraphes pendant la saisie de mails
:au BufEnter *.eml set formatoptions+=aw
:au BufEnter *.eml set textwidth=72

" :au BufEnter *.eml :setlocal spell spelllang=fr
:au BufEnter *.eml :set spell
:au BufEnter *.eml :set nofoldenable

" :au BufEnter *.txt :setlocal spell spelllang=fr
":au BufEnter *.txt :set spell

:au BufEnter *vimperator-*.tmp :set spell
:au BufEnter *vimperator-*.tmp set formatoptions+=aw
:au BufEnter *vimperator-*.tmp set textwidth=72

:au BufEnter *pentadactyl.txt :set spell
:au BufEnter *pentadactyl.txt set formatoptions+=aw
:au BufEnter *pentadactyl.txt set textwidth=72

" QD specific
:au BufEnter *Perforce/Main/ICE/* :set tags=D:/Perforce/Main/ICE/tags
:au BufEnter *Perforce/Main/ICE/*/*.js :set tags=
:au BufEnter *Perforce/Branches/Release/6.0.12.Main/ICE/* :set tags=D:/Perforce/Branches/Release/6.0.12.Main/ICE/tags
:au BufEnter *Perforce/Main/Farm/Cluster/HeadNode/* :set tags=D:/Perforce/Main/Farm/Cluster/HeadNode/tags

:au BufEnter *Perforce/Branches/Main_Five/ICE/* :set tags=D:/Perforce/Branches/Main_Five/ICE/tags

" Perforce stuff
" Set a buffer-local variable to the perforce path, if this file is under the perforce root.
function! IsUnderPerforce()
  if exists("$P4HOME")
    if expand("%:p") =~ ("^" . escape($P4HOME, '\'))
      let b:p4path = substitute(substitute(expand("%:p"), escape($P4HOME, '\'), "//depot", ""), "\\", "/", "g")
    endif
  endif
endfunction

" Confirm with the user, then checkout a file from perforce.
function! P4Checkout()
  if exists("b:p4path")
    if (confirm("Checkout from Perforce?", "&Yes\n&No", 1) == 1)
      call system("p4 edit " . b:p4path . " > /dev/null")
      if v:shell_error == 0
        set noreadonly
        let v:fcs_choice = "reload"
      endif
    endif
  endif
endfunction

if !exists("au_p4_cmd")
  let au_p4_cmd=1
  au BufEnter * call IsUnderPerforce()
  au FileChangedRO * call P4Checkout()
endif


" C++ header command
:nmap <leader>gc m'02f:lyt(O//-----------------------------------------------------------------------------<CR>! @brief		<Esc>pa<CR>! @details		<CR>! @param		<CR>! @return		<CR>! @author		MTH : <C-R>=strftime("%Y-%m-%d")<CR><CR>-----------------------------------------------------------------------------<Esc>j

