setlocal tags+=~/.vim/tags/go
setlocal path+=/usr/lib/go/src/pkg/
setlocal path+=$GOPATH
setlocal makeprg=go\ build
augroup  golang
	autocmd!
	autocmd FileType go NeoCompleteLock
	autocmd FileType go au BufNewFile 0read ~/maler/go.template
	autocmd FileType go au BufWritePre <buffer> Fmt
augroup END
