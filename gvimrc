" remove scrollbars, bug, needs to add then remove
set guioptions+=LlRrb
set guioptions-=LlRrb
set guioptions-=T " toolbar
set guioptions-=m " menu

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

set bg=light
" colorscheme solarized
" colorscheme molokai
colorscheme lightning

if !has('gui_running')
	let g:rehash256=1
end

" set guifont=Ubuntu\ Mono\ derivative\ Powerline\ for\ Powerline
" set guifont=Inconsolata-g\ Medium\ 12
" set guifont=Inconsolata-dz\ \for\ Powerline\ Medium\ 11
if has("gui_win32")
	set guifont=monofur:h11:cANSI
else
    set guifont=monofur\ 13
endif

" vim: set ft=vim:
