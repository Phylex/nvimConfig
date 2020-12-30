set background=dark

if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

let colors_name = "nabla"

" General colors
hi Normal		ctermfg=252		ctermbg=0		cterm=none	guifg=#b5bdc3	guibg=#080808	gui=none
hi Cursor		ctermfg=240		ctermbg=200		cterm=none	guifg=#242424	guibg=#333333	gui=none
hi Visual		ctermfg=250		ctermbg=239		cterm=none	guifg=#b3b6ba	guibg=#554d4b	gui=none
hi VisualNOS	ctermfg=252		ctermbg=236		cterm=none	guifg=#c3c6ca	guibg=#303030	gui=none
hi Search		ctermfg=171		ctermbg=241		cterm=none	guifg=#d787ff	guibg=#636066	gui=none
hi Folded		ctermfg=103		ctermbg=237		cterm=none	guifg=#a0a8b0	guibg=#3a4046	gui=none
hi Title		ctermfg=230						cterm=bold	guifg=#ffffd7					gui=bold
hi StatusLine	ctermfg=230		ctermbg=238		cterm=none	guifg=#ffffd7	guibg=#444444	gui=italic
hi VertSplit	ctermfg=238		ctermbg=238		cterm=none	guifg=#444444	guibg=#444444	gui=none
hi StatusLineNC	ctermfg=241		ctermbg=235		cterm=none	guifg=#857b6f	guibg=#444444	gui=none
hi LineNr		ctermfg=4		ctermbg=232		cterm=none	guifg=#857b6f	guibg=#080808	gui=none
hi SpecialKey	ctermfg=241		ctermbg=234		cterm=none	guifg=#626262	guibg=#282828	gui=none
hi WarningMsg	ctermfg=203									guifg=#ff5f55
hi ErrorMsg		ctermfg=196		ctermbg=236		cterm=bold	guifg=#ff2026	guibg=#3a3a3a	gui=bold

" Vim >= 7.0 specific colors
if version >= 700
hi CursorLine	ctermbg=236						cterm=none					guibg=#22222f	gui=none
hi MatchParen	ctermfg=228		ctermbg=101		cterm=bold	guifg=#eae788	guibg=#857b6f	gui=bold
hi Pmenu		ctermfg=230		ctermbg=238					guifg=#ffffd7	guibg=#444444	gui=none
hi PmenuSel		ctermfg=232		ctermbg=192					guifg=#080808	guibg=#35ff35	gui=none
endif

" Diff highlighting
hi DiffAdd						ctermbg=17									guibg=#2a0d6a
hi DiffDelete	ctermfg=234		ctermbg=60 		cterm=none	guifg=#242424	guibg=#3e3969	gui=none
hi DiffText						ctermbg=53		cterm=none					guibg=#73186e	gui=none
hi DiffChange					ctermbg=237									guibg=#382a37

" Syntax highlighting
hi Comment		ctermfg=75						cterm=none	guifg=#666666					gui=italic
hi Constant		ctermfg=161						cterm=none	guifg=#27a55e					gui=none
hi String		ctermfg=113						cterm=none	guifg=#27a59d					gui=italic
hi Character	ctermfg=113						cterm=none	guifg=#30a527					gui=italic
hi Number		ctermfg=202						cterm=none	guifg=#ff6a00					gui=none
hi Boolean		ctermfg=202						cterm=none	guifg=#ffea0a					gui=none
hi Float		ctermfg=202						cterm=none	guifg=#ffae00					gui=none

hi Identifier	ctermfg=192			cterm=none			guifg=#fc02bd	gui=none
hi Function	ctermfg=27			cterm=none			guifg=#1952ff   gui=none

hi Statement	ctermfg=28			cterm=none			guifg=#1fa8f2   gui=none
hi Conditional	ctermfg=202			cterm=none			guifg=#a72dff	gui=none
hi Repeat	ctermfg=202			cterm=none			guifg=#694cf7	gui=none
hi Label	ctermfg=202			cterm=none			guifg=#d0a7f9	gui=none
hi Operator	ctermfg=202			cterm=none			guifg=#83c9fc	gui=none
hi Keyword	ctermfg=100			cterm=none			guifg=#1a8cff	gui=none
hi Exception	ctermfg=202			cterm=none			guifg=#b8d5f9	gui=none

hi PreProc	ctermfg=173			cterm=none			guifg=#228B22	gui=none
hi Include	ctermfg=202			cterm=none			guifg=#2ea536	gui=none
hi Define	ctermfg=202			cterm=none			guifg=#2cba60	gui=none
hi Macro	ctermfg=202			cterm=none			guifg=#86ba2c	gui=none
hi PreCondit	ctermfg=202			cterm=none			guifg=#27dd8f	gui=none

hi Type		ctermfg=186			cterm=none			guifg=#73a2f4	gui=none
hi StorageClass	ctermfg=202			cterm=none			guifg=#5825db	gui=none
hi Structure	ctermfg=202			cterm=none			guifg=#cc2288	gui=none
hi Typedef	ctermfg=202			cterm=none			guifg=#db2525	gui=none

hi Special	ctermfg=229			cterm=none			guifg=#619136	gui=none
hi SpecialChar	ctermfg=202			cterm=none			guifg=#FFFFFF	gui=none
hi Tag		ctermfg=202			cterm=none			guifg=#FFFFFF	gui=none
hi Delimiter	ctermfg=202			cterm=none			guifg=#FFFFFF	gui=none
hi SpecialComment	ctermfg=202			cterm=none			guifg=#555599	gui=none
hi Debug	ctermfg=202			cterm=none			guifg=#FFFFFF	gui=none

hi Todo		ctermfg=172	ctermbg=57	cterm=none			guifg=#ffff00	gui=italic
hi Error	ctermfg=202			cterm=none			guifg=#FFFFFF	gui=none


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


if version >= 703 " has('colorcolumn') is broken...
    hi ColorColumn ctermbg=235 guibg=#2e2e2e
endif
