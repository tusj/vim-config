"   --- PERSONAL ---

	" source ~/.vim/plugin-confs/vundle.vim

	set nocompatible
	set encoding=utf-8

	" autocompletions
		set completeopt=menu,preview
		set omnifunc=syntaxcomplete#Complete
		au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main
		set tags+=~/.vim/tags

	" Completion
		set wildmode=longest,list:longest
		set wildignore="*.swp,*.bak,*.pyc,*~"

	" Terminal
		" Time out on key codes but not mappings.
		" Basically this makes terminal Vim work sanely.
		if &shell =~# 'fish$'
			set shell=fish
		endif
		set notimeout
		set ttimeout
		set ttimeoutlen=100
		set title " terminal title
		set ttyfast

	" Backup
		set nobackup
		set noswapfile
		" Disable swap files
		set updatecount=0

	" Move undo and info files to .vim

		" viminfo stores the the state of your previous editing session
		set viminfo+=n~/.vim/viminfo

		if exists("+undofile")
			" This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
			" :help undo-persistence
			" This is only present in 7.3+
			if isdirectory($HOME . '/.vim/undo') == 0
				:silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
			endif
			set undodir+=~/.vim/undo//
			set undofile
		endif

	" Keys
		let mapleader = "-"
		nnoremap ø :
		vnoremap ø :

		" semi-colon is too hard to reach
			nnoremap å ;
			vnoremap å ;
			nnoremap Å ,
			vnoremap Å ,

		" remap command line scrolling
			cnoremap <C-p> <Up>
			cnoremap <C-n> <Down>

		" make replace more natural by
		" treating tabs as several spaces
		nnoremap R gR

		" open new vertical split and focus
			nnoremap <leader>w <C-w>v<C-w>l

		" Esc remappings
			imap jj <Esc>

			map <F7> mzgg=G`z<CR>

			nnoremap j gj
			nnoremap k gk

		" Get the right vim technique
			nnoremap <up>    <nop>
			nnoremap <down>  <nop>
			nnoremap <left>  <nop>
			nnoremap <right> <nop>
			inoremap <up>    <nop>
			inoremap <down>  <nop>
			inoremap <left>  <nop>
			inoremap <right> <nop>

		" Count folded lines as several
			nnoremap j gj
			nnoremap k gk

		" if pasting code makes it wrongly tabbed,
		" toggle paste mode and echo status
			nnoremap <F2> :set invpaste paste?<CR>
			set pastetoggle=<F2>
			set showmode

		" Bubble single lines
			nmap <C-Up> [e
			nmap <C-Down> ]e
			" Bubble multiple lines
			vmap <C-Up> [egv
			vmap <C-Down> ]egv
			vmap <C-Down> ]egv
			"
		" Visually select the text that was last edited/pasted
			nmap gV `[v`]

		" Edit .vimrc
			nnoremap <leader>ev :tabedit $MYVIMRC<cr>

		" Shift Window Focus
			nnoremap <C-h> <C-w>h
			nnoremap <C-j> <C-w>j
			nnoremap <C-k> <C-w>k
			nnoremap <C-l> <C-w>l

		" Maximize window on focus
			map <C-j> <C-W>j<C-W>_
			map <C-k> <C-W>k<C-W>_
			map <C-h> <C-W>h<C-W>_
			map <C-l> <C-W>l<C-W>_

		" shift tab focus
			map <C-S-]> gt
			map <C-S-[> gT
			map <C-1> 1gt
			map <C-2> 2gt
			map <C-3> 3gt
			map <C-4> 4gt
			map <C-5> 5gt
			map <C-6> 6gt
			map <C-7> 7gt
			map <C-8> 8gt
			map <C-9> 9gt
			map <C-0> :tablast<CR>

		" Global copy paste shortcut
			vnoremap <Leader>x "+d
			vnoremap <Leader>c "+y
			nnoremap <Leader>v "+gP

		" Insert new line above and below cursor
			map <M-O> m`O<Esc>`
			map <M-o> m`o<Esc>``

		" make * and # search work in visual mode too
			xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
			xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>

			" recursively vimgrep for word under cursor or selection if you hit leader-star
			nmap <leader>* :execute 'noautocmd vimgrep /\V' . substitute(escape(expand("<cword>"), '\'), '\n', '\\n', 'g') . '/ **'<CR>
			vmap <leader>* :<C-u>call <SID>VSetSearch()<CR>:execute 'noautocmd vimgrep /' . @/ . '/ **'<CR>"

	" Display
		colorscheme molokai
		set guioptions-=T "Don't display toolbar

		" List invisible characters
			set list
			set listchars=tab:▸\ ,eol:¬

		set cursorline
		set wrap
		set textwidth=99
		set formatoptions=qrn1
		set colorcolumn=85

		" remove scrollbars
		set guioptions-=l
		set guioptions-=r
		set guioptions-=b

		set relativenumber
		au InsertEnter * call InsertStatuslineColor(v:insertmode)
		au InsertChange * call InsertStatuslineColor(v:insertmode)
		au InsertLeave * hi statusline guibg=green

		" Change cursor color depending on mode
			highlight Cursor guifg=white guibg=black
			highlight iCursor guifg=white guibg=steelblue
			set guicursor=n-v-c:block-Cursor
			set guicursor+=i:ver10-iCursor
			set guicursor+=n-v-c:blinkon0
			set guicursor+=i:blinkwait10

	" Behaviour
		set formatprg=par\ -w100
		"set autochdir
		set splitright
		set splitbelow

		set nrformats=
		" Automatically update file if it has
		" been modified outside vim
		set autoread

		" hide buffer instead of closing them
		set hidden
		set scrolloff=2

		" -- Tabbing --
			" search term contains upper case
			set smarttab
			set softtabstop=4
			set shiftwidth=4
			set tabstop=4

		" -- Searching --
			set ignorecase " when searching
			set smartcase  " case-sensitife if
			" search without regex normally
			nnoremap / /\V

			" highlight as you type
			set incsearch
			set hlsearch
			set showmatch
			nnoremap <leader>f :noh<cr>

			set gdefault   " default global

		" Save on lost focus if buffer has name
		autocmd FocusLost * silent! wall

		" Go to command mode on focus lost
		autocmd FocusLost,TabLeave * call feedkeys("\<C-\>\<C-n>")

		"filetype specific

			" python
				autocmd FileType python set noautoindent

			" Syntax of these languages is fussy over tabs Vs spaces
			autocmd FileType make setlocal ts=4 sts=4 sw=4 noexpandtab
			autocmd FileType yaml setlocal ts=4 sts=4 sw=4 expandtab

			" Customisations based on house-style (arbitrary)
			autocmd FileType html setlocal ts=4 sts=4 sw=4 expandtab
			autocmd FileType css setlocal ts=4 sts=4 sw=4 expandtab
			autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab

			" Treat .rss files as XML
			autocmd BufNewFile,BufRead *.rss setfiletype xml

		" Strip trailing whitespace on save
		autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

		" Source the vimrc file after saving it
			if has("autocmd")
				autocmd bufwritepost .vimrc source $MYVIMRC
			endif

" ----- Plugin specific -------

	" Minimal pathogen setup
		execute pathogen#infect()
		syntax on
		filetype plugin indent on

	" MiniBufExplorer
		map <Leader>b :TMiniBufExplorer<cr>
		" enable ctrl + arrows and crtl + vim nav
		" to switch window focus
		let g:miniBufExplMapWindowNavArrows = 1
		let g:miniBufExplMapWindowNavVim    = 1
		" enable switching of buffer in window
		let g:miniBufExplMapCTabSwitchBufs  = 1

	" Yankring settings
		nnoremap <silent> <F11> :YRShow<CR>

	" Gundo
		nnoremap <F5> :GundoToggle<CR>

	" Rainbow Parentheses
		let g:rbpt_max = 3
		let g:rbpt_colorpairs = [
			\ ['brown',       'RoyalBlue3'],
			\ ['Darkblue',    'SeaGreen3'],
			\ ['darkgray',    'DarkOrchid3'],
			\ ['darkgreen',   'firebrick3'],
			\ ['darkcyan',    'RoyalBlue3'],
			\ ['darkred',     'SeaGreen3'],
			\ ['darkmagenta', 'DarkOrchid3'],
			\ ['brown',       'firebrick3'],
			\ ['gray',        'RoyalBlue3'],
			\ ['black',       'SeaGreen3'],
			\ ['darkmagenta', 'DarkOrchid3'],
			\ ['Darkblue',    'firebrick3'],
			\ ['darkgreen',   'RoyalBlue3'],
			\ ['darkcyan',    'SeaGreen3'],
			\ ['darkred',     'DarkOrchid3'],
			\ ['red',         'firebrick3'],
			\ ]

	" Latex Suite
		set grepprg=grep\ -nH\ $*
		let g:tex_flavor='latex'

	" Goformat
		autocmd Filetype go command! Fmt call Goformat()

	" Yankring
		let g:yankring_history_dir = '$XDG_CACHE_HOME'

	" Set sane colour mapping to rainbow
		tmenu ToolBar.taglist Toggle display of the Taglist
		amenu ToolBar.taglist :TlistToggle<CR>

	" Tagbar
		let g:tagbar_autoclose = 1
		nnoremap <silent> <F9> :TagbarToggle<CR>
		nmap <F8> :TagbarToggle<CR>

	" Gotags
		source $HOME/.vim/plugin-confs/gotags.vim

	" Suggestion on indenting
		" vmap <D-]> >gv
		" vmap <D.[> <gv
		" display cwd of current view on status bar
		" display different colour when caps lock is on
		" set hide pattern for netrw plugin to hide .files

	" fish-plugin
		compiler fish
		setlocal foldmethod=expr

	" Powerline
		"let g:Powerline_symbols = 'fancy'

	" CtrlP
		let g:ctrlp_map = '<c-f>'

	" easy motion
		let g:EasyMotion_leader_key = 'æ'

	" taskList
		map <leader>t <Plug>TaskList

	" autocomplpop
		" unset because there's an error in autocomplpop
		" let g:acp_behaviorSnipmateLength = 1

	" easytags
		"let g:easytags_file = '~/.vim/tags'

	" vim runtime
		runtime macros/matchit.vim

	" you complete me
		let g:ycm_min_num_of_chars_for_completion = 2
		let g:ycm_global_ycm_extra_conf ="~/.vim/bundle/YouCompleteMe/python/ycm/youcompleteme.py"

	" vim-session
	let g:session_autosave='no'
	let g:session_autoload='yes'

" ----- functions -----

	" Custom mode color in status bar
	function! InsertStatuslineColor(mode)
		if a:mode == 'i'
			hi statusline guibg=magenta
		elseif a:mode == 'r'
			hi statusline guibg=blue
		else
			hi statusline guibg=red
		endif
	endfunction

	" golang
	if !exists("*Goformat")
		function Goformat()
			let regel=line(".")
			%!~/bin/gofmt
			call cursor(regel, 1)
		endfunction
	endif

	" Strip trailing whitespace
	function! <SID>StripTrailingWhitespaces()
		" Preparation: save last search, and cursor position.
		let _s=@/
		let l = line(".")
		let c = col(".")
		" Do the business:
		%s/\s\+$//e
		" Clean up: restore previous search history, and cursor position
		let @/=_s
		call cursor(l, c)
	endfunction

	" Make * and # search work in visual mode too"
	function! s:VSetSearch(cmdtype)
		let temp = @s
		norm! gv"sy
		let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
		let @s = temp
	endfunction

	" after focus lost
	" TODO Restrict search to current window
	" makes * and # work on visual mode too.
	" TODO ADD delay to return to command mode
