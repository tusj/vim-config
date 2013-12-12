function! myautoloads#WinMove(key)
	let t:curwin = winnr()
	exec "wincmd ".a:key
	if (t:curwin == winnr()) "we havent moved
		if (match(a:key,'[jk]')) "were we going up/down
			wincmd v
		else
			wincmd s
		endif
		exec "wincmd ".a:key
	endif
endfunction

function! myautoloads#StripTrailingWhitespaces()
	" Preparation: save last search, and cursor position.
	let _s=@/
	let l = line(".")
	let c = col(".")
	" Do the business:
	%s/\s\+$//e
	" Clean up: restore previous search history, and cursor position
	let @/=_s
	call cursor(l, c)
endfunction

" open link on cursor with default browser
function! myautoloads#Browser()
	let line0 = getline (".")
	let line = matchstr (line0, "http[^ ]*")
	if line==""
		let line = matchstr (line0, "ftp[^ ]*")
	endif
	if line==""
		let line = matchstr (line0, "file[^ ]*")
	endif
	let line = escape (line, "#?&;|%")
	"echom line
	exec "silent !xdg-open ".line." &"
endfunction

" Make * and # search work in visual mode too"
function! myautoloads#VSetSearch(cmdtype)
	let temp = @s
	norm! gv"sy
	let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
	let @s = temp
endfunction


" Strip trailing whitespace
function! myautoloads#ExecuteMacroOverVisualRange()
	echo "@".getcmdline()
	execute ":'<,'>normal @".nr2char(getchar())
endfunction

