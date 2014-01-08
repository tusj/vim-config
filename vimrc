" Basic
	set encoding=utf-8
	set updatetime=1000 " ms
	set confirm

	" Minimal pathogen setup…
	execute pathogen#infect()

	syntax on
	filetype plugin indent on

	set dictionary=/usr/share/hunspell/en_GB.dic,/usr/share/hunspell

	" Backup
		" set no ~ files, no .swp files, updatecount = 0 makes swapfile option irrelevant
		set nobackup
		set noswapfile
		" Disable swap files
		set updatecount=0

	" Terminal
		if !has('gui')
			set term=$TERM          " Make arrow and other keys work
		endif
		if &shell =~# 'fish$'
			set shell=bash\ --login
		endif
		set ttyfast
		set title					" terminal title

	" mouse
		set mouse=a                 " Automatically enable mouse usage
		set mousehide               " Hide the mouse cursor while typing

	" viminfo stores the the state of your previous editing session
		set viminfo+=n~/.vim/viminfo

	" session options
		set sessionoptions+=localoptions
		set sessionoptions+=resize
		set sessionoptions+=winpos

	" Move undo and info files to .vim
		if exists("+undofile")
			" This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
			" :help undo-persistence
			" This is only present in 7.3+
			if isdirectory($HOME . '/.vim/undo') == 0
				:silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
			endif
			set undodir=~/.vim/undo/
			set undofile
		endif

	" make Vim respect XDG
		" set directory=$XDG_CACHE_HOME/vim,~/,/var/tmp
		" set backupdir=$XDG_CACHE_HOME/vim,~/,/var/tmp
		" set viminfo+=$XDG_CACHE_HOME/vim/viminfo
		" set runtimepath=$XDG_CONFIG_HOME/vim,$XDG_CONFIG_HOME/vim/after,$VIM,$VIMRUNTIME
		" let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc"


" Display
	set showbreak=→\ " this comment must be here
	"…
	set t_Co=256 " must be before colorscheme


	set background=dark
	colorscheme molokai

	" List invisible characters
		set list
		"set listchars=tab:▸\ ,eol:¬
		set listchars=tab:▸\ ,

	set cursorline
	set wrap
	set textwidth=120
	set formatoptions=qrn1
	set relativenumber


	if has('statusline')
		set laststatus=2 " always display

		"Broken down into easily includeable segments
		set statusline=%<%f\                     " Filename
		set statusline+=%w%h%m%r                 " Options
		set statusline+=%{fugitive#statusline()} " Git Hotness
		set statusline+=\ [%{&ff}/%Y]            " Filetype
		set statusline+=\ [%{getcwd()}]          " Current dir
		set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
	endif

	" Search
	set showmatch
	set matchtime=5

" Behavior
	" Allow for cursor beyond last character
		set virtualedit="block"

	" autocompletions
		set completeopt=menuone,preview
		set complete+=kspell
		set omnifunc=syntaxcomplete#Complete
		set tags+=./tags;

	" Completion
		set wildmenu
		set wildmode=list:full
		set wildignore="*.swp,*.bak,*.pyc,*~,*.o,*.obj,*.bak,*.exe,*.aux,*.out,*.toc,*.jpg,*.bmp"

	" Autocommands
		" set only cursorline for active window
		augroup showActiveWindow
			autocmd!
			autocmd BufEnter * set cursorline
			autocmd BufLeave * set nocursorline
		augroup END

		augroup testgroup
			autocmd!
			" Save all on lost focus if buffer has name
			autocmd FocusLost * silent! wall

			" Strip trailing whitespace on save
			autocmd BufWritePre * :call myautoloads#StripTrailingWhitespaces()
		augroup END

		" equalize window on resized
		augroup windows
			autocmd!
			autocmd VimResized * :wincmd =
		augroup END

		augroup fileTypes
			" Treat .rss files as XML
			autocmd BufNewFile,BufRead *.rss setfiletype xml

			autocmd FileType c,h           setlocal tags+=~/.vim/tags/c
			autocmd FileType cpp,hpp       setlocal tags+=~/.vim/tags/c++
			autocmd FileType py            setlocal tags+=~/.vim/tags/py_2.7,~/.vim/tags/tags_py_3.2

			" Enable omni completion.
			autocmd FileType cpp           setlocal omnifunc=omni#cpp#complete#Main
			autocmd FileType css           setlocal omnifunc=csscomplete#CompleteCSS
			autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
			autocmd FileType javascript    setlocal omnifunc=javascriptcomplete#CompleteJS
			autocmd FileType python        setlocal omnifunc=pythoncomplete#Complete
			autocmd FileType ruby          setlocal omnifunc=rubycomplete#Complete
			autocmd FileType xml           setlocal omnifunc=xmlcomplete#CompleteTags
			autocmd BufWritePost vimrc     source $MYVIMRC
		augroup END

	set smartindent
	set formatprg=par\ -w100
	"set autochdir
	set splitright
	set splitbelow

	" Automatically update file if it has been modified outside vim
		set autoread

	" hide buffer instead of closing them
		set hidden

	set scrolljump=20
	set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize

		" Tabbing
		" search term contains upper case
		set smarttab
		set softtabstop=4
		set shiftwidth=4
		set shiftround
		set tabstop=4

	" conceal feature
		" conceal everything but sub / superscripts
		let g:tex_conceal="adgm"

	" searching
		set ignorecase " when searching
		set smartcase  " case-sensitife if

		" highlight as you type
			set incsearch
			set hlsearch

		set gdefault   " default global on substitute command

" Keymaps
	let mapleader = '\'
	let maplocalleader = "\\"

	" nnoremap <space> za

	" Diff
		nnoremap do do]c
		nnoremap dp do]c

	" Symbols
		imap ... …
		imap ->  →
		imap :)  ☺
		imap :-) ☺

	" Insert one character before
		nnoremap s :exec "normal i".nr2char(getchar())."\e"<CR>
		" :nnoremap S :exec "normal a".nr2char(getchar())."\e"<CR>

	" TABS
		" nnoremap <2-LeftMouse> <C-w><C-]><C-w>T " open tag in new tab
		" nnoremap <C-W>     :tabclose<CR>
		" nnoremap <C-Tab>   :tabnext<CR>
		" nnoremap <C-S-Tab> :tabprev<CR>

	" I use the colon more often than the semicolon
		nnoremap : ;
		nnoremap ; :
		cnoremap : ;
		cnoremap ; :
		xnoremap : ;
		xnoremap ; :
		vnoremap : ;
		vnoremap ; :

	" keep only marked area
		vnoremap o ygg"_dGpkdd

	" Window focus and create
		nnoremap wwh : call myautoloads#WinMove('h')<cr>
		nnoremap wwk : call myautoloads#WinMove('k')<cr>
		nnoremap wwl : call myautoloads#WinMove('l')<cr>
		nnoremap wwj : call myautoloads#WinMove('j')<cr>

	" window rotate
		nnoremap wwr <C-W>r

	" Window resize
		nnoremap <left>  :12wincmd <<cr>
		nnoremap <right> :12wincmd ><cr>
		nnoremap <up>    :12wincmd +<cr>
		nnoremap <down>  :12wincmd -<cr>

	" alternative resizing
		nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
		nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

	" map go to tags interactively
		noremap <C-]> g<C-]>
		" noremap g<C-]> <C-]>

	" remap command line scrolling
		cnoremap <C-p> <Up>
		cnoremap <C-n> <Down>

	" treating tabs as several spaces
		nnoremap R gR

	" Esc remappings
		inoremap jj <Esc>
		cnoremap jj <Esc>

	" open url in browser
		nnoremap <C-LeftMouse> :call myautoloads#Browser()<cr>

	" Indent whole file
		noremap g= mzgg=G`z<CR>m'z

	" move visual line, not folded
		nnoremap j gj
		nnoremap k gk

	" Visual shifting (does not exit Visual mode)
		vnoremap < <gv
		vnoremap > >gv

	" Visual line repeat {{{2
		xnoremap . :normal .<CR>
		xnoremap @ :<C-u>call myautoloads#ExecuteMacroOverVisualRange()<CR>

	" Get the right vim technique
		inoremap <up>    <nop>
		inoremap <down>  <nop>
		inoremap <left>  <nop>
		inoremap <right> <nop>

	" Count folded lines as several
		nnoremap j gj
		nnoremap k gk

	" " Bubble single lines
		" 	nmap <C-Up> ddkP
		" 	nmap <C-Down> ddp

	" " Bubble multiple lines
		" 	vmap <C-Up> xkP`[V`]
		" 	vmap <C-Down> xp`[V`]

	" Bubble single lines, depending on tpope's unimpaired
		nmap <m-k> [e
		nmap <m-j> ]e

	" Bubbl multiple lines in visual mode
		vmap <C-k> [egv
		vmap <C-j> ]egv

	" Visually select the text that was last edited/pasted
		nnoremap gV `[v`]

	" shift tab focus
		"nnoremap <C-]> :tabnext<CR>
		"nnoremap <C-[> :tabprevious<CR>
		noremap <A-1> 1gt
		noremap <A-2> 2gt
		noremap <A-3> 3gt
		noremap <A-4> 4gt
		noremap <A-5> 5gt
		noremap <A-6> 6gt
		noremap <A-7> 7gt
		noremap <A-8> 8gt
		noremap <A-9> 9gt
		noremap <A-0> :tablast<cr>

	" Global copy paste shortcut
		" vnoremap <leader>X "+d
		" vnoremap <leader>C "+y
		" nnoremap <leader>V "+gP

	" Insert new line above and below cursor
		noremap <leader-o> m`o<Esc>``

	" make * and # search work in visual mode too
		xnoremap * :<C-u>call myautoloads#VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
		xnoremap # :<C-u>call myautoloads#VSetSearch('?')<CR>?<C-R>=@/<CR><CR>

	" recursively vimgrep for word under cursor or selection if you hit leader-star
		nnoremap <leader>* :execute 'noautocmd vimgrep /\V' . substitute(escape(expand("<cword>"), '\'), '\n', '\\n', 'g') . '/ **'<CR>
		vnoremap <leader>* :<C-u>call myautoloads#VSetSearch()<CR>:execute 'noautocmd vimgrep /' . @/ . '/ **'<CR>

	" seiarch without regex normally
		nnoremap / /\V

	" Tasklist, todo, bug, issue
		command! Issue :execute 'vimgrep ISSUE '.expand('%') | :copen | :cc
		command! Bug   :execute 'vimgrep BUG '.expand('%')   | :copen | :cc
		command! Todo  :execute 'vimgrep TODO '.expand('%')  | :copen | :cc

	" autocomplete popup menu behavior exprimentation
		" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
		" inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
		" 	\ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
		" inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
		" 	\ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

	" CtrlP
		nnoremap <leader>f :CtrlP<cr>
		nnoremap <leader>b :CtrlPBuffer<cr>
		nnoremap <leader>m :CtrlPMRUFiles<cr>
		nnoremap <leader>t :CtrlPTag<cr>

" Plugins
	" haskell
		let g:haddock_browser="chromium"

	" neocomplete
		let g:neocomplete#enable_at_startup = 1

	" easy-align
		" For visual mode (e.g. vip<Enter>)
		vnoremap <Enter>   <Plug>(EasyAlign)
		" For normal mode, with Vim movement (e.g. <Leader>aip)
		nnoremap <Leader>a <Plug>(EasyAlign)
		" Repeat alignment in visual mode with . key
		vmap . <Plug>(EasyAlignRepeat)

	" ft-lua
		" crashes if omni is defined
		let g:lua_define_omnifunc = 0
		" let g:lua_check_syntax  = 0
		let g:lua_complete_omni   = 1

	" AutoComplPop
		let g:acp_behaviorCssOmniValueLength   = 2
		let g:acp_behaviorFileLength           = 2
		let g:acp_behaviorHtmlOmniLength       = 2
		let g:acp_behaviorPythonOmniLength     = 2
		let g:acp_behaviorRubyOmniMethodLength = 2
		let g:acp_behaviorXmlOmniLength        = 2

	" ultisnips
		set rtp+=~/.vim/bundle/ultisnips

	" Opa
		set rtp+=/usr/share/opa/vim

	" golden ratio
		let g:golden_ratio_exclude_nonmodifiable = 1

	" ctrlp
	let g:ctrlp_by_filename = 1
	set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux



	" airline
		"let g:airline_powerline_fonts                  = 1
		"let g:airline#extensions#tabline#enabled       = 1
		"let g:airline_inactive_collapse                = 0
		let g:airline#extensions#bufferline#enabled     = 1
		let g:airline#extensions#tabline#buffer_nr_show = 1
		let g:airline#extensions#tabline#enabled        = 1
		let g:airline#extensions#whitespace#enabled     = 0
		let g:airline_exclude_preview                   = 1

	" Most recently used
		let MRU_File = $HOME . "/.vim/mru-files"

	" YankRing
		nnoremap qyy :YRShow<CR>
		" let g:yankring_history_dir = $XDG_CACHE_HOME
		let g:yankring_history_dir = "~/.cache"

		set cpoptions+=y

	" nerdtree
		" autocmd vimenter * if !argc() | NERDTree | endif
		noremap qnn :NERDTreeToggle<CR>

	" close vim if only nerdtree is open
	"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

	" Latex Suite
		set grepprg=grep\ -nH\ $*
		let g:tex_flavor='latex'
		let g:Tex_CompileRule_dvi = 'latex -src-specials -interaction=nonstopmode $*'
		let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 --interaction=nonstopmode $*'
		let g:Tex_ViewRule_pdf = 'evince_dbus.py'
		let g:Tex_DefaultTargetFormat = 'pdf'

	" latex
		let b:tex_flavor = 'pdflatex'

	" live latex preview
		let g:livepreview_previewer = 'okular'

	" Tagbar
		nnoremap <Leader>tt :TagbarToggle<CR>
		let g:tagbar_autoclose = 1

	" Gotags
		source $HOME/.vim/plugin-confs/gotags.vim

	" easytags
		let g:easytags_file = '~/.vim/tags/easytags'
		let g:easytags_dynamic_files = 2 " create tags file in projectdir
		" let geasytags_languages


	" redir steve losh
		" function! RedirToClipboardFunction(cmd, ...)
		" 	let cmd = a:cmd . " " . join(a:000, " ")
		" 	redir @*>
		" 	exe cmd
		" 	redir END
		" endfunction

		" command! -complete=command -nargs=+ RedirToClipboard
		" 	\ silent! call RedirToClipbaordFunction(<f -args>)ing settings



	" tpope's live align with tabular
		" inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

		" function! s:align()
			" let p = '^\s*|\s.*\s|\s*$'
			" if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
			" 	let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
			" 	let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
			" 	Tabularize/|/l1
			" 	normal! 0
			" 	call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
			" endif
		" endfunction

	" populate arglist with files with search matches
		" command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()

		" function! QuickfixFilenames()
			" " Building a hash ensures we get each buffer only once
			" let buffer_numbers = {}
			" for quickfix_item in getqflist()
			" 	let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
			" endfor
			" return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
		" endfunction

	" paste convenient
		function! Paste()
			set paste
			normal "+p
			set nopaste
		endfunction
		command! Paste call Paste()<CR>


	" remove duplicates
		function! RemoveDuplicates()
			%sort
			g/^\(.*\)$\n\1$/d
		endfunction

" TODO
	" Restrict search to current window
	" make messages display newest first
	" Remove autoclose " comments for vimscripts
	" set dictionary completion on latex and txt files
	" display cwd of current view on status bar
	" display different colour when caps lock is on
	" set hide pattern for netrw plugin to hide .files
	" unset hlsearch after substitute command

" vim: set ft=vim foldmethod=indent:
