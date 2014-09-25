" remove scrollbars, bug, needs to add then remove
set guioptions+=LlRrb
set guioptions-=LlRrb
set guioptions-=mT " toolbar

" Change cursor color depending on mode
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver10-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10

function! SetColor()
	echo v:insertmode
	if v:insertmode == 'i'
		hi iCursor guifg=white guibg=turquoise
	elseif v:insertmode == 'r'
		hi iCursor guifg=white guibg=tomato
	elseif v:insertmode == 'v'
		hi iCursor guifg=red guibg=orange
	endif
endfunction

au InsertEnter * call SetColor()
au InsertChange * call SetColor()
"au InsertLeave * hi CursorLine guifg= guibg=

if !has('gui_running')
	let g:rehash256=1
end
" set guifont=Ubuntu\ Mono\ derivative\ Powerline\ for\ Powerline
" vim: set ft=vim:
