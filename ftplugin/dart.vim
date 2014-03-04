" Replace path to sdk for analyzer setup
set makeprg=dartanalyzer\ --enable_type_checks\ %\ 2>&1\ \\\|\ sed\ 's/file://'
function! s:DartFormat()
  silent execute "%!dartfmt"
endfunction

command! -buffer Fmt call s:DartFormat()

augroup dartformat
  autocmd!
  autocmd BufWritePre <buffer> Fmt
augroup END
