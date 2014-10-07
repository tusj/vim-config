if exists('current_compiler')
	finish
endif
let current_compiler = 'hdevtools'
let errorformat= '\%-Z\ %#,'.
			\ '%W%f:%l:%c:\ Warning:\ %m,'.
			\ '%E%f:%l:%c:\ %m,'.
			\ '%E%>%f:%l:%c:,'.
			\ '%+C\ \ %#%m,'.
			\ '%W%>%f:%l:%c:,'.
			\ '%+C\ \ %#%tarning:\ %m,'
CompilerSet errorformat="errorformat"
CompilerSet makeprg=hdevtools\ check\ %
