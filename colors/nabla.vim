set background=dark

if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

let colors_name = "nabla"

" General colors
hi Normal		guifg=#b5bdc3	guibg=#080808	gui=none
hi Cursor		guifg=#242424	guibg=#333333	gui=none
hi Visual		guifg=#b3b6ba	guibg=#554d4b	gui=none
hi VisualNOS	guifg=#c3c6ca	guibg=#303030	gui=none
hi Search		guifg=#d787ff	guibg=#636066	gui=none
hi Folded		guifg=#a0a8b0	guibg=#3a4046	gui=none
hi Title		guifg=#ffffd7					gui=bold
hi StatusLine	guifg=#ffffd7	guibg=#444444	gui=italic
hi VertSplit	guifg=#444444	guibg=#444444	gui=none
hi StatusLineNC	guifg=#857b6f	guibg=#444444	gui=none
hi LineNr		guifg=#857b6f	guibg=#080808	gui=none
hi SpecialKey	guifg=#626262	guibg=#282828	gui=none
hi WarningMsg	guifg=#ff5f55
hi ErrorMsg		guifg=#ff2026	guibg=#3a3a3a	gui=bold
hi CursorLine					guibg=#22222f	gui=none
hi MatchParen	guifg=#eae788	guibg=#857b6f	gui=bold
hi Pmenu		guifg=#ffffd7	guibg=#444444	gui=none
hi PmenuSel		guifg=#080808	guibg=#35ff35	gui=none

" Diff highlighting
hi DiffAdd						guibg=#2a0d6a
hi DiffDelete	guifg=#242424	guibg=#3e3969	gui=none
hi DiffText						guibg=#73186e	gui=none
hi DiffChange					guibg=#382a37

" Syntax highlighting
hi Comment			guifg=#666666	gui=italic
hi Constant			guifg=#27a55e	gui=none
hi String			guifg=#27a59d	gui=italic
hi Character		guifg=#30a527	gui=italic
hi Number			guifg=#ff6a00	gui=none
hi Boolean			guifg=#ffea0a	gui=none
hi Float			guifg=#ffae00	gui=none

hi Identifier		guifg=#fc02bd	gui=none
hi Function			guifg=#1952ff   gui=none

hi Statement		guifg=#1fa8f2   gui=none
hi Conditional		guifg=#a72dff	gui=none
hi Repeat			guifg=#694cf7	gui=none
hi Label			guifg=#d0a7f9	gui=none
hi Operator	  		guifg=#83c9fc	gui=none
hi Keyword	  		guifg=#1a8cff	gui=none
hi Exception		guifg=#b8d5f9	gui=none

hi PreProc			guifg=#228B22	gui=none
hi Include			guifg=#2ea536	gui=none
hi Define			guifg=#2cba60	gui=none
hi Macro			guifg=#86ba2c	gui=none
hi PreCondit		guifg=#27dd8f	gui=none

hi Type				guifg=#73a2f4	gui=none
hi StorageClass		guifg=#5825db	gui=none
hi Structure		guifg=#cc2288	gui=none
hi Typedef			guifg=#db2525	gui=none

hi Special			guifg=#619136	gui=none
hi SpecialChar		guifg=#FFFFFF	gui=none
hi Tag				guifg=#FFFFFF	gui=none
hi Delimiter		guifg=#FFFFFF	gui=none
hi SpecialComment	guifg=#555599	gui=none
hi Debug			guifg=#FFFFFF	gui=none

hi Todo				guifg=#dfff00	gui=italic	guibg=#000000
hi Error			guifg=#dd0047	gui=none	guibg=#000000


" Link
hi! link FoldColumn		Folded
hi! link CursorColumn	CursorLine
hi! link NonText		LineNr

" Vimwiki Colors
hi VimwikiHeader1 guifg=#1474fc
hi VimwikiHeader2 guifg=#2eddb4
hi VimwikiHeader3 guifg=#4edd2e
hi VimwikiHeader4 guifg=#fce114
hi VimwikiHeader5 guifg=#fc6d14
