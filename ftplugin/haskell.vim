compiler hlint
setlocal omnifunc=necoghc#omnifunc

nnoremap <Localleader>t :HdevtoolsType<cr>
nnoremap <Localleader>i :HdevtoolsInfo<cr>


augroup MyHaskell
	autocmd CursorMoved *.hs :HdevtoolsClear
augroup END

set foldlevel=1


" Set error format of ghc
setlocal errorformat=
                    \%-Z\ %#,
                    \%W%f:%l:%c:\ Warning:\ %m,
                    \%E%f:%l:%c:\ %m,
                    \%E%>%f:%l:%c:,
                    \%+C\ \ %#%m,
                    \%W%>%f:%l:%c:,
                    \%+C\ \ %#%tarning:\ %m,

" Redirect stderr to stdout
setlocal shellpipe=2>

syntax match hsNiceOperator "!!" conceal cchar=‼
compiler hdevtools

" vim: set ft=vim:
" vim: foldmethod=indent:
