function! WinMove(key)
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

map <leader>h : call WinMove('h')<cr>
map <leader>k : call WinMove('k')<cr>
map <leader>l : call WinMove('l')<cr>
map <leader>j : call WinMove('j')<cr>
map <leader>H : wincmd H<cr>
map <leader>K : wincmd K<cr>
map <leader>L : wincmd L<cr>
map <leader>J : wincmd J<cr>

