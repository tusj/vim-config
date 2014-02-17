setlocal tags+=~/.vim/tags/go
setlocal path+=/usr/lib/go/src/pkg/
setlocal path+=$GOPATH
setlocal makeprg=go\ build
autocmd FileType go NeoCompleteLock
autocmd BufNewFile 0read ~/maler/go.template
autocmd BufWritePre <buffer> Fmt
