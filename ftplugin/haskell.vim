compiler hlint
setlocal omnifunc=necoghc#omnifunc
augroup haskell
	autocmd CursorHold *.hs :GhcModType
augroup END

" vim: set ft=vim foldmethod=indent:
