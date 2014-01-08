function! SyncTex()
	let filename = bufname("%")
	let lineno = line(".")
	for syncfile in split(system('zgrep -l "' . filename . '" *.synctex.gz'), "\n")
		let pdffile = substitute(syncfile, ".synctex.gz$", ".pdf", "")
		exec 'silent !evince_dbus ' .
			\ '"' . pdffile . '" ' . lineno . ' "' . filename . '" &'
	endfor
endfunction

autocmd CursorHold *.tex call SyncTex()
" CursorHold add maybe BufWritePost,FileWritePost
"autocmd BufWritePost,FileWritePost *.tex call CompileTex()

autocmd BufLeave *.tex exec "silent !pkill evince"
"autocmd BufWritePost *.tex :Make

" enable conceal feature
	setlocal cole=2
	highlight Conceal guifg=#F8F8F2 guibg=#1B1D1E
compiler tex
set smartindent
set makeprg=pdflatex\ \-file\-line\-error\ \-interaction=nonstopmode\ \-synctex=1\ %:p
"set makeprg=pdflatex\ \-file\-line\-error\ \-interaction=nonstopmode\ \-synctex=1\ $*\\\|\ grep\ \-P\ ':\\d{1,5}:\ $:p'
set errorformat=%f:%l:\ %m

autocmd BufNewFile 0read ~/maler/latex.template
