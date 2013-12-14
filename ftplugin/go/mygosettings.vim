setlocal tags+=~/.vim/tags/go
setlocal path+=/usr/lib/go/src/pkg/
setlocal path+=$GOPATH
autocmd BufNewFile 0read ~/maler/go.template
