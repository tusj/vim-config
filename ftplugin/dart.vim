" Replace path to sdk for analyzer setup
" set makeprg=dartanalyzer\ --machine\ %\ 2>&1\ \\\|\ cut\ --delimiter=\\\|\ -f\ 4-6,8
set makeprg=formatDartAnalyzer\ %
" set makeprg=dartanalyzer\ --machine\ %\ 2>&1\ \\\|\ sed\ 's/file://'
" set makeprg=dartanalyzer --machine\ % 2>&1 | cut -d '|' -f 4-6,8"
" -enable_type_checks\ %\ 2>&1\ \\\|\ sed\ 's/file://'
" set makeprg=dartanalyzer\ %
" set errorformat=%m\ (%-f\,\ line\ %l\,\ col\ %c)
set errorformat=%f\|%l\|%c\|%m
function! s:DartFormat()
	let view = winsaveview()
	silent execute "%!dartfmt"
	if v:shell_error
		let errors = []
		for line in getline(1, line('$'))
			let tokens = matchlist(line, '^\(.\{-}\):\(\d\+\):\(\d\+\)\s*\(.*\)')
			if !empty(tokens)
				call add(errors, {"filename": @%,
								 \"lnum":	   tokens[2],
								 \"col":	  tokens[3],
								 \"text":	  tokens[4]})
			endif
		endfor
		if empty(errors)
			% | " Couldn't detect dartfmt error format, output errors
		endif
		undo
		if !empty(errors)
			call setqflist(errors, 'r')
		endif
		echol Error | echomsg "Gofmt returned error" | echol None
	endif
	call winrestview(view)
endfunction

command! -buffer Fmt call s:DartFormat()

augroup dartformat
  autocmd!
  " autocmd BufWritePre <buffer> Fmt
augroup END
