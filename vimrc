" Vundle setup
	filetype off
	" set the runtime path to include Vundle and initialize
	let g:textobj_entire_no_default_key_mappings=1
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()

	" Plugin 'git://github.com/Valloric/YouCompleteMe'
	" Plugin 'git://github.com/bling/vim-bufferline'
	" Plugin 'git://github.com/eagletmt/ghcmod-vim'
	" Plugin 'git://github.com/endel/vim-github-colorscheme'
	" Plugin 'git://github.com/kana/vim-smartword'
	" Plugin 'git://github.com/vim-scripts/YankRing.vim'
	" Plugin 'git://github.com/vim-scripts/candycode.vim'
	" Plugin 'git://github.com/wincent/command-t'
	" Plugin 'git://github.com/xolox/vim-easytags'
	Plugin 'git://github.com/Julian/vim-textobj-brace'
	Plugin 'git://github.com/Lokaltog/vim-easymotion'
	Plugin 'git://github.com/Shougo/neocomplete.vim'
	Plugin 'git://github.com/SirVer/ultisnips'
	Plugin 'git://github.com/Twinside/vim-haskellConceal'
	Plugin 'git://github.com/airblade/vim-gitgutter'
	Plugin 'git://github.com/altercation/vim-colors-solarized'
	Plugin 'git://github.com/beloglazov/vim-textobj-quotes'
	Plugin 'git://github.com/bkad/CamelCaseMotion'
	Plugin 'git://github.com/bronson/vim-visual-star-search'
	Plugin 'git://github.com/dag/vim-fish'
	Plugin 'git://github.com/dag/vim2hs'
	Plugin 'git://github.com/dan-t/vim-hdevtools'
	Plugin 'git://github.com/eagletmt/neco-ghc'
	Plugin 'git://github.com/glts/vim-textobj-comment'
	Plugin 'git://github.com/gmarik/Vundle.vim'
	Plugin 'git://github.com/godlygeek/tabular'
	Plugin 'git://github.com/goldfeld/vim-seek'
	Plugin 'git://github.com/honza/vim-snippets'
	Plugin 'git://github.com/itchyny/lightline.vim'
	Plugin 'git://github.com/justinmk/vim-sneak'
	Plugin 'git://github.com/kana/vim-textobj-entire'
	Plugin 'git://github.com/kana/vim-textobj-lastpat'
	Plugin 'git://github.com/kana/vim-textobj-line'
	Plugin 'git://github.com/kana/vim-textobj-user'
	Plugin 'git://github.com/kshenoy/vim-signature'
	Plugin 'git://github.com/lervag/vim-latex'
	Plugin 'git://github.com/majutsushi/tagbar'
	Plugin 'git://github.com/maxbrunsfeld/vim-yankstack'
	Plugin 'git://github.com/michaeljsmith/vim-indent-object'
	Plugin 'git://github.com/mileszs/ack.vim'
	Plugin 'git://github.com/nanotech/jellybeans.vim'
	Plugin 'git://github.com/rbonvall/vim-textobj-latex'
	Plugin 'git://github.com/scrooloose/syntastic'
	Plugin 'git://github.com/sgur/vim-textobj-parameter'
	Plugin 'git://github.com/sjl/gundo.vim'
	Plugin 'git://github.com/skammer/vim-css-color'
	Plugin 'git://github.com/thinca/vim-textobj-between'
	Plugin 'git://github.com/tommcdo/vim-exchange'
	Plugin 'git://github.com/tomtom/tcomment_vim'
	Plugin 'git://github.com/tpope/vim-dispatch'
	Plugin 'git://github.com/tpope/vim-eunuch'
	Plugin 'git://github.com/tpope/vim-fugitive'
	Plugin 'git://github.com/tpope/vim-obsession'
	" Plugin 'git://github.com/dhruvasagar/vim-prosession'
	Plugin 'git://github.com/tpope/vim-repeat'
	Plugin 'git://github.com/tpope/vim-sensible'
	Plugin 'git://github.com/tpope/vim-surround'
	Plugin 'git://github.com/tpope/vim-unimpaired'
	Plugin 'git://github.com/vim-scripts/UnconditionalPaste'
	Plugin 'git://github.com/vim-scripts/argtextobj.vim'
	Plugin 'git://github.com/xolox/vim-misc'
	Plugin 'git://github.com/yegappan/mru'
	Plugin 'git://github.com/zeis/vim-kolor'

	call vundle#end()
	call yankstack#setup() " initialization to hijack key bindings

" Basic
	set encoding=utf-8
	set updatetime=1000 " ms
	set confirm

	" Minimal pathogen setup…
	" execute pathogen#infect()

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
				silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
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
	" → ⎆ ⇨ ⟸ ⥰ ⬱ ␊ ⫘ ⩊ ⏖ ↔ ↪ ⨭ ◖ 𝌻 ⌇ ⌒ …
	set showbreak=…
	set t_Co=256 " must be before colorscheme
	set background=dark
	colorscheme molokai
	" highlight normal ctermbg=234


	" List invisible characters
		set list
		" set listchars=tab:➝\ ,eol:¬
		set listchars=tab:⤑\ ,
		"·  ⇾  ⇨  ⇀  ➝  →  ⇥  ⟶  ⟼  ⤏  ⧐  ―

	set cursorline
	set wrap
	set textwidth=80
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

	" Fold presentation
 		set foldtext=MyFoldText()
 		function! MyFoldText()
 			let line = getline(v:foldstart)
 			if match( line, '^[ \t]*\(\/\*\|\/\/\)[*/\\]*[ \t]*$' ) == 0
 				let initial = substitute( line, '^\([ \t]\)*\(\/\*\|\/\/\)\(.*\)', '\1\2', '' )
 				let linenum = v:foldstart + 1
 				while linenum < v:foldend
 				let line = getline( linenum )
 				let comment_content = substitute( line, '^\([ \t\/\*]*\)\(.*\)$', '\2', 'g' )
 				if comment_content != ''
 					break
 				endif
 				let linenum = linenum + 1
 				endwhile
 				let sub = initial . ' ' . comment_content
 			else
 				let sub = line
 				let startbrace = substitute( line, '^.*{[ \t]*$', '{', 'g')
 				if startbrace == '{'
 				let line = getline(v:foldend)
 				let endbrace = substitute( line, '^[ \t]*}\(.*\)$', '}', 'g')
 				if endbrace == '}'
 					let sub = sub.substitute( line, '^[ \t]*}\(.*\)$', '...}\1', 'g')
 				endif
 				endif
 			endif
 			let n = v:foldend - v:foldstart + 1
 			let info = " " . n . " lines"
 			let sub = sub . "                                                                                                                  "
 			let num_w = getwinvar( 0, '&number' ) * getwinvar( 0, '&numberwidth' )
 			let fold_w = getwinvar( 0, '&foldcolumn' )
 			" ↲ ↪ ⧽ 【 ▛ ▟ 】 ⤹ ⬇ ∋ 𝌞 ■ ▌ ▟ ▚ ▼ ◤ ┏ ⎩ ⎝ ⤥ ( ❨ ⟮ ⟫ ⎡ ▏ ▍ ▐
 			let rsign = '⤶'
 			let lsign = '𝌻'
 			let sub = lsign .  strpart( sub, 0, winwidth(0) - strlen( info ) - num_w - fold_w - 1 )
 			return sub . rsign . info
 		endfunction

" Behavior
	set autochdir " sync current directory with current file
	set lazyredraw " avoid redrawing screen while macro is running

	set iskeyword-=_ " treat _ as a word boundary
	set virtualedit="block" " Allow for cursor beyond last character

	" autocompletions
		set completeopt=menuone,preview
		set complete+=kspell
		set omnifunc=syntaxcomplete#Complete
		set tags=./.tags,.tags,/home/s/.vim/tags;

	" Completion
		set wildmenu
		set wildmode=list:longest,full
		set wildignore=*.swp,*.acn,*.aux,*.bak,*.bmp,*.exe,*.glo,*.hi,*.jpg,*.log,*.o,*.out,*.pdf,*.pyc,*.thm,*.toc,*.xdy,*~,*.gz,*.xz,*.tar,*.zip,*.gz(busy)
		set wildignorecase

	" Fold
		" set foldclose=all
		set foldlevel=2

	" Autocommands
		" set only cursorline for active window
		augroup showActiveWindow
			autocmd!
			autocmd BufEnter * set cursorline
			autocmd BufLeave * set nocursorline
		augroup END

		augroup behaviour
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

		augroup folds
			" autocmd CursorMoved * silent! foldopen
		augroup END

		augroup fileTypes
			autocmd!
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
			autocmd FileType python        setlocal tabstop=4 noexpandtab shiftwidth=4
			autocmd FileType ruby          setlocal omnifunc=rubycomplete#Complete
			autocmd FileType xml           setlocal omnifunc=xmlcomplete#CompleteTags
			" ISSUE doesn't work autocmd FileType markdown      setlocal makeprg=markdown\ %\ >%.html
			autocmd BufEnter *.md          setlocal makeprg=markdown\ %\ >%:t:r.html
			autocmd BufWritePost vimrc     source $MYVIMRC
		augroup END

		" templates
		augroup templates
			autocmd!
			autocmd BufNewFile *.tex 0r ~/Copy/templates/latex
			autocmd BufNewFile *.go  0r ~/Copy/templates/go
			autocmd BufNewFile *.hs  0r ~/Copy/templates/haskell
		augroup END

	set formatprg=par\ -w70
	set smartindent
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

			augroup Search
				autocmd InsertEnter * :setlocal nohlsearch
				autocmd InsertLeave * :setlocal hlsearch
			augroup END

		set gdefault   " default global on substitute command

" Keymaps
	let mapleader = "\\"
	let maplocalleader = "-"

	nnoremap <leader>q q:k<CR>
	inoremap <C-W> <esc>:w<CR>

	" Brackets
		" inoremap ` `<C-R>=UltiSnips#Anon("${1:${VISUAL}}`")<CR>
		" inoremap ' '<C-R>=UltiSnips#Anon("${1:${VISUAL}}'")<CR>
		" inoremap " "<C-R>=UltiSnips#Anon('${1:${VISUAL}}"')<CR>
		" inoremap ( (<C-R>=UltiSnips#Anon('${1:${VISUAL}})')<CR>
		" inoremap [ [<C-R>=UltiSnips#Anon('${1:${VISUAL}}]')<CR>
		" inoremap { {<C-R>=UltiSnips#Anon('${1:${VISUAL}}}')<CR>
		" autocmd FileType tex inoremap $ $<C-R>=UltiSnips#Anon("${1:${VISUAL}}\$")<CR>

	" Vim-textobj-entire
		xmap aE <Plug>(textobj-entire-a)
		omap aE <Plug>(textobj-entire-a)
		xmap iE <Plug>(textobj-entire-i)
		omap iE <Plug>(textobj-entire-i)



	" Find last match in line
		nnoremap gf $F

	" nnoremap <C-a> 0<C-a>
	" nnoremap <C-x> 0<C-x>

	" Complete word from line above / under
		"<Esc>gi ensures Insert (not Replace) mode
		inoremap <C-l> <Esc>gi<Space><Esc>gkywgjvpa
		inoremap <C-b> <Esc>gi<Space><Esc>gjywgkvpa

	" Dmenu integration
		map <c-t> :call DmenuOpen("tabe")<cr>
		map <c-f> :call DmenuOpen("e")<cr>

		" Strip the newline from the end of a string
		function! Chomp(str)
			return substitute(a:str, '\n$', '', '')
		endfunction

		" Find a file and pass it to cmd
		function! DmenuOpen(cmd)
			let fname = Chomp(system("locate `pwd` | dmenu -i -l 20 -p " . a:cmd))
			if empty(fname)
				return
			endif
			execute a:cmd . " " . fname
		endfunction

	" delete line focus above
	nnoremap gdd ddk

	" Yank to end of line
	 nnoremap Y y$

	" Dot command in visual mode
		vnoremap . :norm.<CR>

	" Move in insert
		" inoremap <C-h> <left>
		" inoremap <C-j> <down>
		" inoremap <C-k> <up>
		" inoremap <C-l> <right>

	" Help
		cabbrev h vert h

	" Mru
		nnoremap <leader>m :Mru<cr>

	" Diff
		nnoremap do do]c
		nnoremap dp do]c

	" Symbols
		" imap ... …
		" imap ->  →
		imap :)  ☺
		imap :-) ☺

	" Insert one character before
		nnoremap s :exec "normal i".nr2char(getchar())."\e"<CR>
		nnoremap S :exec "normal a".nr2char(getchar())."\e"<CR>

	" Tabs
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
		nnoremap <Leader>h : call myautoloads#WinMove('h')<cr>
		nnoremap <Leader>k : call myautoloads#WinMove('k')<cr>
		nnoremap <Leader>l : call myautoloads#WinMove('l')<cr>
		nnoremap <Leader>j : call myautoloads#WinMove('j')<cr>

	" window rotate
		nnoremap wwr <C-W>r

	" Window resize
		nnoremap <left>  :12wincmd <<cr>
		nnoremap <right> :12wincmd ><cr>
		nnoremap <up>    :12wincmd +<cr>
		nnoremap <down>  :12wincmd -<cr>
		vnoremap <right> :12wincmd ><cr>
		vnoremap <left>  :12wincmd <<cr>
		vnoremap <up>    :12wincmd +<cr>
		vnoremap <down>  :12wincmd -<cr>

	" alternative resizing
		nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
		nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

	" map go to tags interactively
		noremap <C-]> g<C-]>
		" noremap g<C-]> <C-]>

	" remap command line scrolling
		cnoremap <C-j> <Up>
		cnoremap <C-k> <Down>

	" treating tabs as several spaces
		nnoremap R gR

	" Esc remappings
		inoremap jk <Esc><Esc>
		inoremap <Esc> <Esc><Esc>
		" cnoremap jk <Esc>

	" open url in browser
		nnoremap <C-LeftMouse> :call myautoloads#Browser()<cr>

	" if in insert, escape both potential popup menu and go to normal mode
		" imap ^[ <esc><esc>

	" mark whole file
		nnoremap  <leader>a ggVG

	" Indent whole file
		noremap g= mzgg=G`z<CR>m'z

	" delete text to black hole
		nnoremap <Leader>d "_d

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
		" inoremap <up>    <nop>
		" inoremap <down>  <nop>
		" inoremap <left>  <nop>
		" inoremap <right> <nop>

	" Count folded lines as several
		nnoremap j gj
		nnoremap k gk

	" Bubbl multiple lines in visual mode
		vmap <C-k> [egv
		vmap <C-j> ]egv

	" Visually select the text that was last edited/pasted
		nnoremap gV `[v`]

	" Paste
		nnoremap <Leader>v :Paste<CR>
		inoremap <Leader>v <esc>:Paste<CR>a


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

	" search without regex normally
		cnoremap s/ s/\v
		nnoremap / /\v

	" Tabular.vim
		cabbrev tab Tabularize /

	" Tasklist, todo, bug, issue
		command! Issue :execute 'vimgrep ISSUE '.expand('%') | :copen | :cc
		command! Bug   :execute 'vimgrep BUG '.expand('%')   | :copen | :cc
		command! Todo  :execute 'vimgrep TODO '.expand('%')  | :copen | :cc

	" CtrlP
		nnoremap <leader>c :CommandT<cr>

" Plugins
	" Smartword
		" map w  <Plug>(smartword-w)
		" map b  <Plug>(smartword-b)
		" map e  <Plug>(smartword-e)
		" map ge <Plug>(smartword-ge)

	" Syntastic
		let g:syntastic_haskell_checkers = ['hdevtools']

	" Easytags
		let g:easytags_async         = 1
		let g:easytags_dynamic_files = 1
		" let g:easytags_by_filetype   = '~/.vim/filetype_tags'
		let g:easytags_file          = '~/.vim/tags'
		let g:easytags_languages = {
		\   'haskell': {
		\       'cmd': '~/.cabal/bin/lushtags',
		\       'args': [],
		\       'fileoutput_opt': '-f',
		\       'stdout_opt': '-f-',
		\       'recurse_flag': '-R'
		\   }
		\}

	" Gitgutter
		" ⊛ ⁕ ✵ ⚝ ✦ ✶ ❉ ᶯ ␡ ⎌' ⥃' ↚ ⇄
		let g:gitgutter_sign_added = '→'
		let g:gitgutter_sign_removed = '←'
		let g:gitgutter_sign_modified = '↔'
		let g:gitgutter_sign_modified_removed = '↜'

		nnoremap <leader>n :call NextHunkAndView()<cr>
		nnoremap <leader>p :call PrevHunkAndView()<cr>

		function! NextHunkAndView()
			call gitgutter#hunk#next_hunk(1)
			call gitgutter#preview_hunk()
		endfunction
		function! PrevHunkAndView()
			call gitgutter#hunk#prev_hunk(1)
			call gitgutter#preview_hunk()
		endfunction

	" Lightline
		let g:lightline = {
		\ 'component': {
		\   'lineinfo': ' %3l:%-2v',
		\ },
		\ 'component_function': {
		\   'readonly': 'MyReadonly',
		\   'fugitive': 'MyFugitive'
		\ },
		\ 'subseparator': { 'left': '', 'right': '' }
		\ }

		function! MyReadonly()
			return &readonly ? '' : ''
		endfunction

		function! MyFugitive()
			if exists("*fugitive#head")
				let _ = fugitive#head()
				" return strlen(_) ? '⎇'._ : ''
				return strlen(_) ? '⎇'._ : ''
			endif
			return ''
		endfunction

	" neocomplete
		let g:neocomplete#enable_at_startup = 1
		let g:neocomplete#enable_smart_case = 1
		let g:neocomplete#sources#syntax#min_keyword_length = 3
		inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
		function! s:my_cr_function()
			return pumvisible() ? "\<C-n>" . neocomplete#close_popup() . "\<Esc>" : "\<CR>"
		endfunction

		inoremap <expr><C-g> neocomplete#undo_completion()
		inoremap <expr><C-l> neocomplete#complete_common_string()
		inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
		inoremap <expr><C-Tab> pumvisible() ? "\<C-n><esc>" : "\<Tab>"

	" haskell
		let g:haddock_browser="chromium"
		highlight HaskellType ctermbg=232
		let g:ghcmod_type_highlight = 'HaskellType'

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
		let g:UltiSnipsExpandTrigger="<C-a>"
		let g:UltiSnipsJumpForwardTrigger="<C-j>"
		let g:UltiSnipsJumpBackwardTrigger="<C-k>"
		let g:UltiSnipsEditSplit="vertical"
		set rtp+=~/.vim/UltiSnips

	" golden ratio
		let g:golden_ratio_exclude_nonmodifiable = 1

	" airline
		let g:airline#extensions#bufferline#enabled     = 1
		let g:airline#extensions#syntastic#enabled      = 1
		let g:airline#extensions#tabline#buffer_nr_show = 1
		let g:airline#extensions#tabline#enabled        = 1
		let g:airline#extensions#tabline#fnamemod       = 1
		let g:airline#extensions#tagbar#enabled         = 1
		let g:airline#extensions#hunks#enabled          = 1
		let g:airline#extensions#hunks#non_zero_only    = 0
		" let g:airline#extensions#tagbar#flags         = 'f'
		" let g:airline#extensions#tagbar#flags         = 's'
		" let g:airline#extensions#tagbar#flags         = 'p'
		let g:airline#extensions#whitespace#enabled     = 0
		let g:airline_exclude_preview                   = 1
		let g:airline_inactive_collapse                 = 1
		let g:airline_powerline_fonts                   = 1
		let g:airline_theme                             = "powerlineish"


	" Most recently used
		let MRU_File = $HOME . "/.vim/mru-files"

	" YankStack
	let g:yankstack_map_keys = 0
	nmap <c-p> <Plug>yankstack_substitute_older_paste
	nmap <c-n> <Plug>yankstack_substitute_newer_paste

	" nerdtree
		" autocmd vimenter * if !argc() | NERDTree | endif
		noremap qnn :NERDTreeToggle<CR>

	" close vim if only nerdtree is open
	"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

	" necoghc
		let g:necoghc_enable_detailed_browse = 1

	" Tagbar
		nnoremap <Leader>t :TagbarToggle<CR>
		let g:tagbar_autoclose = 1
		let g:tagbar_autofocus = 1

" Functions
	" Diff of current content with saved content
		function! s:DiffWithSaved()
			let filetype=&ft
			diffthis
			vnew | r # | normal! 1Gdd
			diffthis
			exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
		endfunction
		com! DiffSaved call s:DiffWithSaved()

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

	" You complete me
		let g:ycm_semantic_triggers = {'haskell' : ['.']}
		let g:ycm_min_num_of_chars_for_completion = 3

" Startup
	if glob("Session.vim") != ''
		silent source Session.vim
	endif

" Text objects
	call textobj#user#plugin('number', {
	\   'natural': {
	\     'pattern': '\v\d+',
	\     'select': ['ad', 'id'],
	\   },
	\   'frac': {
	\     'pattern': '\v\d+(\.\d+)?\/\d+(\.\d+)?',
	\     'select': ['af', 'if'],
	\   },
	\   'real': {
	\     'pattern': '\v\d+(\.\d+)?',
	\     'select': ['an', 'in'],
	\   }
	\ })
	call textobj#user#plugin('block', {
	\   '-': {
	\     'select-a-function': 'VerticalBlockInner',
	\     'select-a': 'iC',
	\     'select-i-function': 'HorizontalBlockInner',
	\     'select-i': 'iR',
	\   },
	\ })

python << endpython
import vim
from os.path import commonprefix

# cursor position compatible with getpos
def pos(row, col):
	return "[0, %d, %d, 0]" % (row, col)

def getcol(i):
	ret = []
	for row in vim.current.buffer:
		if i < len(row):
			ret.append(row[i])
		else:
			ret.append("\0")

	return "".join(ret)

def get_cursor():
	(cursor_row, cursor_col) = vim.current.window.cursor
	cursor_row               = cursor_row - 1
	return (cursor_row, cursor_col)

# Finds the biggest sub row matching either above
# or below witht the same content, starting at (row, col)
def find_region_horizontal():
	(row, col) = get_cursor()

	buf        = vim.current.buffer
	match_with = buf[row]

	# Check if it is valid to match above or below
	match_above = row > 0
	match_below = row < len(buf)
	above_end   = below_end = col

	# Set the maximum index, and if valid
	# find the last common index above and below
	if match_above:
		above      = buf[row-1]
		max_above  = min(len(above), len(match_with))

		if col < max_above:
			above_end = col + len(commonprefix([above[col:], match_with[col:]]))

	if match_below:
		below      = buf[row+1]
		max_below  = min(len(below), len(match_with))

		if col < max_below:
			below_end = col + len(commonprefix([below[col:], match_with[col:]]))

	# find the first common index above and below
	above_start = col - len(commonprefix([(above[:col])[::-1], (match_with[:col])[::-1]]))
	below_start = col - len(commonprefix([(below[:col])[::-1], (match_with[:col])[::-1]]))

	# return the longest common range of above and below
	above_range = above_end - above_start
	below_range = below_end - below_start

	range       = above
	region      = (above_start, above_end)

	if below_range > above_range:
		range   = below
		region  = (below_start, below_end)

	return region

# Find the index of the biggest uniform sub column from (row, col):
def find_region_vertical():
	(row, col)  = get_cursor()

	column      = getcol(col)
	char        = column[row]

	# Separate the parts of the column
	above       = (column[:row])[::-1]
	below       = column[row:]

	# Find the longest common part
	above_start = row - len(commonprefix([above, len(above) * char]))
	below_end   = row + len(commonprefix([below, len(below) * char]))

	print("above_start, below_end: %d, %d" % (above_start, below_end))

	return (above_start, below_end)

# Checks if a sub row is equal to match_with
def match_horizontal(row, start_col, match_with):

	line    = vim.current.buffer[row]
	end_col = start_col + len(match_with)

	if end_col < len(line):
		return line[start_col:end_col] == match_with

	return False

# Checks if a vertical sub column is only containing the same character
def match_vertical(col, start_row, end_row):

	col = getcol(col)

	if end_row < len(col):
		sub = col[start_row:end_row]
		return sub == len(sub) * sub[0]

	return False

	# Searches from row /column 'begin' to row / column 'end'
	# not stopping before the 'matcher' fails.
	# Returns the row / column end point before the matcher failed
	# or the start if the start failed
	# The check parameters are static parameters delegated to
	# the 'matcher'
def search(begin, end, checks, matcher):
	stop = begin
	for i in range(begin, end, 1 if end > begin else -1 ):

		if not matcher(i, *checks):
			return stop
		else:
			stop = i
	return stop

def make_region(finder, search_start, last, make_checks, matcher, make_points):
	points  = finder()
	checks  = make_checks(*points)
	begin   = search(search_start,   -1, checks, matcher)
	end     = search(search_start, last, checks, matcher)
	points  = make_points(begin, end, *points)
	vim.command("return [\"\\<C-v>\",%s, %s]" % points)

def posser(head, tail):
	return (pos(*head), pos(*tail))

def make_points_vertical(begin, end, point_start, point_end):
	head = (point_start + 1, begin + 1)
	tail = (point_end, end + 1)
	return posser(head, tail)

def make_points_horizontal(begin, end, point_start, point_end):
	head = (begin + 1, point_start + 1)
	tail = (end + 1, point_end)
	return posser(head, tail)

def make_checks_vertical(point_start, point_end):
	return (point_start, point_end)

def make_checks_horizontal(point_start, point_end):
	(cursor_row, _) = get_cursor()
	buf             = vim.current.buffer
	return (point_start, buf[cursor_row][point_start:point_end])

def find_block_horizontal():
	(cursor_row, _) = get_cursor()
	buf             = vim.current.buffer
	last            = len(buf)
	finder          = find_region_horizontal
	search_start    = cursor_row
	matcher         = match_horizontal
	make_points     = make_points_horizontal
	make_checks     = make_checks_horizontal

	make_region(finder, search_start, last, make_checks, matcher, make_points)

def find_block_vertical():
	(_, cursor_col) = get_cursor()
	buf             = vim.current.buffer
	last            = len(max(buf, key     = len))
	finder          = find_region_vertical
	search_start    = cursor_col
	matcher         = match_vertical
	make_points     = make_points_vertical
	make_checks     = make_checks_vertical

	make_region(finder, search_start, last, make_checks, matcher, make_points)
endpython

function! VerticalBlockInner()
python << endpython
find_block_vertical()
endpython
endfunction

function! HorizontalBlockInner()
python << endpython
find_block_horizontal()
endpython
endfunction

" TODO
	" unset hlsearch after substitute command
	" fix paste command

" vim: set ft=vim foldmethod=indent:
