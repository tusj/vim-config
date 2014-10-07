" Vim compiler file
" Language:    ConTeXt (file type context)
" Maintainer:  Aditya Mahajan <adityam [at] umich [dot] edu>
" Last Change: 2007-06-17

if exists("current_compiler") && current_compiler =~ 'texexec'
  finish
endif

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let current_compiler = 'texexec'
let &l:makeprg = 'texmfstart texexec --nonstopmode --passon=-file-line-error $*'

let s:cpo_save = &cpo
set cpo-=C      "Allow line-continuation

CompilerSet errorformat=
      \%E%>%f:%l:\ %m,
      \%Cl.%l\ %m,
      \%+C\ \ %m.,
      \%+C%.%#-%.%#,
      \%+C%.%#[]%.%#,
      \%+C[]%.%#,
      \%+C%.%#%[{}\\]%.%#,
      \%+C<%.%#>%.%#,
      \%GOutput\ written\ on\ %m,
      \%GTeXExec\ \|\ run%m

let &cpo = s:cpo_save
unlet s:cpo_save

" uses evince, draws focus, does not function
function! SyncTexEvince()
	let filenameString = bufname("%")
	let lineno = line(".")
	echom filenameString
	echom lineno
	for syncfile in split(system('zgrep -l "' . filenameString . '" *.synctex.gz'), "\n")
		let pdffile = substitute(syncfile, ".synctex.gz$", ".pdf", "")
		let callString = '!evince-dbus ' .
			\ '"' . pdffile . '" ' . lineno . ' "' . filenameString . '" &'
		echom callString
		exec callString
	endfor
endfunction

" dependent on vim-latex-suit
function! Tex_ForwardSearchLaTeX()
	let cmd = 'evince-forward-search ' . fnamemodify(Tex_GetMainFileName(), ":p:r") .  '.pdf ' . line(".") . ' ' . expand("%:p") . '&'
	let output = system(cmd)
endfunction

augroup Tex
	autocmd!
	autocmd BufWritePost *.tex silent Make!
augroup END

nnoremap <LocalLeader>s :silent call SyncTexEvince()<CR><C-L>

" enable conceal feature
setlocal cole=2
highlight Conceal guifg=#F8F8F2 guibg=#1B1D1E
set makeprg=context\ \-\-synctex\ \-\-nonstopmode\ %
set smartindent

" vim: set ft=vim
