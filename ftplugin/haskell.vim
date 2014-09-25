compiler hlint
setlocal omnifunc=necoghc#omnifunc
nnoremap <Localleader>t :GhcModType<cr>
augroup MyHaskell
	autocmd CursorMoved *.hs :GhcModTypeClear
augroup END
set foldlevel=1
set wildignore+="*.hi,*.o"
" vim: set ft=vim foldmethod=indent:
