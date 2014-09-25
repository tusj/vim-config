compiler hlint
setlocal omnifunc=necoghc#omnifunc
nnoremap <Localleader>t :HdevtoolsType<cr>
nnoremap <Localleader>i :HdevtoolsInfo<cr>
augroup MyHaskell
	autocmd CursorMoved *.hs :HdevtoolsClear
augroup END
set foldlevel=1
" vim: set ft=vim foldmethod=indent:
