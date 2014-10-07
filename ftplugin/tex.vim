" uses evince, draws focus, does not function
function! SyncTexEvince()
	let filenameString = bufname("%")
	let lineno = line(".")
	echom filenameString
	echom lineno
	for syncfile in split(system('zgrep -l "' . filenameString . '" *.synctex.gz'), "\n")
		let pdffile = substitute(syncfile, ".synctex.gz$", ".pdf", "")
		let callString = '!evince_dbus ' .
			\ '"' . pdffile . '" ' . lineno . ' "' . filenameString . '" &'
		echom callString
		exec callString
	endfor
endfunction

" uses okular
function! SyncTexOkular()
   let execstr = "silent !okular --unique %:p:r.pdf\\#src:".line(".")."%:p &"
   exec execstr
endfunction

" dependent on vim-latex-suit
function! Tex_ForwardSearchLaTeX()
	let cmd = 'evince_forward_search ' . fnamemodify(Tex_GetMainFileName(), ":p:r") .  '.pdf ' . line(".") . ' ' . expand("%:p")
	let output = system(cmd)
endfunction

augroup Tex
	autocmd!
	" autocmd CursorHold *.tex call SyncTex()
	" CursorHold add maybe BufWritePost,FileWritePost

	autocmd BufEnter *.tex call SyncTexEvince()
	autocmd BufLeave *.tex exec "silent !pkill okular"
	autocmd BufWritePost *.tex silent Make!
	autocmd BufWritePost *.tex call SyncTexEvince()
augroup END

nnoremap <LocalLeader>s :call SyncTexEvince()<CR>

" enable conceal feature
	setlocal cole=2
	highlight Conceal guifg=#F8F8F2 guibg=#1B1D1E
compiler tex
set smartindent

silent !mkdir build > /dev/null 2>&1
silent !ln -s build/%:r.pdf > /dev/null 2>&1

set makeprg=lualatex\ \-file\-line\-error\ \-output-directory=build\ \-interaction=nonstopmode\ \-synctex=1\ %:t
"set makeprg=pdflatex\ \-file\-line\-error\ \-interaction=nonstopmode\ \-synctex=1\ $*\\\|\ grep\ \-P\ ':\\d{1,5}:\ $:p'
set errorformat=%f:%l:\ %m

function! Labels()
	set grepprg=ack\ \-o
	silent !grep "\\label\{(.*?)\}" %
	copen
endfunction

nnoremap <LocalLeader>l :call Labels()<CR>
set wildignore+="*.aux,*.out,*.toc"
" vim: set ft=vim
