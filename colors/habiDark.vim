"*****************************************************************************
"** Name:      habiDark.vim                                                 **
"** Type:      color scheme for dark background (GUI only)                  **
"** Author:    Christian Habermann                                          **
"**            christian (at) habermann-net (point) de                      **
"** Copyright: (c) 2002-2003 by Christian Habermann                         **
"**            Permission is hereby granted to use and distribute this code,**
"**            with or without modifications, provided that this copyright  **
"**            notice is copied with it. This code is provided *as is* and  **
"**            comes with no warranty of any kind, either expressed or      **
"**            implied. The copyright holder will not be liable for any     **
"**            damages resulting from the use of this software.             **
"**                                                                         **
"** Versions:  V 1.0.1,  9. Oct. 2003                                       **
"**              - email address added                                      **
"**              - fix in description                                       **
"**                                                                         **
"**            V 1.0.0, 24. Oct. 2002                                       **
"**              first release                                              **
"**                                                                         **
"*****************************************************************************
"** Description:                                                            **
"**  This script defines a color scheme for dark backgrounds.               **
"**  Place this script in .vim\colors  and add                              **
"**    colorscheme habiDark                                                 **
"**  to your .vimrc file.                                                   **
"**                                                                         **
"*****************************************************************************

set background=dark

hi clear
if exists( "syntax_on" )
    syntax reset
endif

let g:colors_name="habiDark"

highlight Normal     guibg=black    guifg=#D0D0D0    gui=NONE
highlight Comment    guifg=#10B010                   gui=NONE
highlight Constant   guifg=#90FF80                   gui=NONE
highlight Special    guifg=magenta                   gui=NONE
highlight Statement  guifg=#10FFFF                   gui=NONE
highlight PreProc    guifg=#10FFFF                   gui=NONE
highlight Type       guifg=#10FFFF                   gui=NONE
highlight Error      guifg=black    guibg=red        gui=NONE
highlight Todo       guifg=black    guibg=yellow     gui=NONE
highlight Cursor     guifg=black    guibg=white      gui=NONE
highlight NonText    guibg=black    guifg=lightblue  gui=NONE
highlight Number     guifg=#5070FF                   gui=NONE
highlight Boolean    guifg=#5070FF                   gui=NONE
highlight Float      guifg=#5070FF                   gui=NONE
highlight StatusLine guifg=black    guibg=#B0B0B0    gui=NONE

highlight Visual     guifg=white    guibg=blue       gui=NONE


" special highlights for my c.vim add-on
highlight KDE              guifg=magenta gui=NONE
highlight mySpecialSymbols guifg=yellow  gui=NONE

" vim: nowrap
