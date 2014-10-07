compiler hlint
setlocal omnifunc=necoghc#omnifunc

nnoremap <Localleader>t :HdevtoolsType<cr>
nnoremap <Localleader>i :HdevtoolsInfo<cr>

augroup MyHaskell
	autocmd!
	autocmd CursorMoved  *.hs :HdevtoolsClear
	autocmd BufWritePost *.hs :silent !fast-tags % &
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
syntax match hsNiceOperator "\*\*0" conceal cchar=⁰
syntax match hsNiceOperator "\*\*1" conceal cchar=¹
syntax match hsNiceOperator "\*\*2" conceal cchar=²
syntax match hsNiceOperator "\*\*3" conceal cchar=³
syntax match hsNiceOperator "\*\*4" conceal cchar=⁴
syntax match hsNiceOperator "\*\*5" conceal cchar=⁵
syntax match hsNiceOperator "\*\*6" conceal cchar=⁶
syntax match hsNiceOperator "\*\*7" conceal cchar=⁷
syntax match hsNiceOperator "\*\*8" conceal cchar=⁸
syntax match hsNiceOperator "\*\*9" conceal cchar=⁹
syntax match hsNiceOperator "\*\*n" conceal cchar=ⁿ
syntax match hsNiceOperator "\*\*i" conceal cchar=ⁱ
syntax match hsNiceOperator "\*\* 0" conceal cchar=⁰
syntax match hsNiceOperator "\*\* 1" conceal cchar=¹
syntax match hsNiceOperator "\*\* 2" conceal cchar=²
syntax match hsNiceOperator "\*\* 3" conceal cchar=³
syntax match hsNiceOperator "\*\* 4" conceal cchar=⁴
syntax match hsNiceOperator "\*\* 5" conceal cchar=⁵
syntax match hsNiceOperator "\*\* 6" conceal cchar=⁶
syntax match hsNiceOperator "\*\* 7" conceal cchar=⁷
syntax match hsNiceOperator "\*\* 8" conceal cchar=⁸
syntax match hsNiceOperator "\*\* 9" conceal cchar=⁹
syntax match hsNiceOperator "\*\* n" conceal cchar=ⁿ
syntax match hsNiceOperator "\*\* i" conceal cchar=ⁱ

compiler hdevtools

" vim: set ft=vim:
" vim: foldmethod=indent:
