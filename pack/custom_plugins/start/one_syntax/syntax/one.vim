if exists("b:current_syntax")
 finish
endif

if exists("g:lisp_isk")
 exe "setl isk=".g:lisp_isk
elseif !has("patch-7.4.1142")
 setl isk=38,42,43,45,47-58,60-62,64-90,97-122,_
else
 syn iskeyword 38,42,43,45,47-58,60-62,64-90,97-122,_
endif

syn cluster			lispAtomCluster		contains=lispAtomBarSymbol,lispAtomList,lispAtomNmbr0,lispComment,lispDecl,lispFunc,lispLeadWhite,lispPrimitive
syn cluster			lispBaseListCluster	contains=lispAtom,lispAtomBarSymbol,lispAtomMark,lispBQList,lispBarSymbol,lispComment,lispConcat,lispDecl,lispFunc,lispKey,lispList,lispNumber,lispEscapeSpecial,lispSymbol,lispVar,lispLeadWhite,lispPrimitive
if exists("g:lisp_instring")
 syn cluster			lispListCluster		contains=@lispBaseListCluster,lispString,lispInString,lispInStringString
else
 syn cluster			lispListCluster		contains=@lispBaseListCluster,lispString
endif

" ---------------------------------------------------------------------
" Lists: {{{1
syn match			lispSymbol			contained			![^()'`,"; \t]\+!
syn match			lispBarSymbol			contained			!|..\{-}|!
if exists("g:lisp_rainbow") && g:lisp_rainbow != 0
 syn region lispParen0           matchgroup=hlLevel0 start="`\=(" end=")" skip="|.\{-}|" contains=@lispListCluster,lispParen1
 syn region lispParen1 contained matchgroup=hlLevel1 start="`\=(" end=")" skip="|.\{-}|" contains=@lispListCluster,lispParen2
 syn region lispParen2 contained matchgroup=hlLevel2 start="`\=(" end=")" skip="|.\{-}|" contains=@lispListCluster,lispParen3
 syn region lispParen3 contained matchgroup=hlLevel3 start="`\=(" end=")" skip="|.\{-}|" contains=@lispListCluster,lispParen4
 syn region lispParen4 contained matchgroup=hlLevel4 start="`\=(" end=")" skip="|.\{-}|" contains=@lispListCluster,lispParen5
 syn region lispParen5 contained matchgroup=hlLevel5 start="`\=(" end=")" skip="|.\{-}|" contains=@lispListCluster,lispParen6
 syn region lispParen6 contained matchgroup=hlLevel6 start="`\=(" end=")" skip="|.\{-}|" contains=@lispListCluster,lispParen7
 syn region lispParen7 contained matchgroup=hlLevel7 start="`\=(" end=")" skip="|.\{-}|" contains=@lispListCluster,lispParen8
 syn region lispParen8 contained matchgroup=hlLevel8 start="`\=(" end=")" skip="|.\{-}|" contains=@lispListCluster,lispParen9
 syn region lispParen9 contained matchgroup=hlLevel9 start="`\=(" end=")" skip="|.\{-}|" contains=@lispListCluster,lispParen0
else
 syn region lispList			matchgroup=Delimiter start="("   skip="|.\{-}|"			matchgroup=Delimiter end=")"	contains=@lispListCluster
 syn region lispBQList			matchgroup=PreProc   start="`("  skip="|.\{-}|"			matchgroup=PreProc   end=")"		contains=@lispListCluster
endif

" ---------------------------------------------------------------------
" Atoms: {{{1
syn match lispAtomMark			"'"
syn match lispAtom			"'("me=e-1			contains=lispAtomMark	nextgroup=lispAtomList
syn match lispAtom			"'[^ \t()]\+"			contains=lispAtomMark
syn match lispAtomBarSymbol		!'|..\{-}|!			contains=lispAtomMark
syn region lispAtom			start=+'"+			skip=+\\"+ end=+"+
syn region lispAtomList			contained			matchgroup=Special start="("	skip="|.\{-}|" matchgroup=Special end=")"	contains=@lispAtomCluster,lispString,lispEscapeSpecial
syn match lispAtomNmbr			contained			"\<\d\+"
syn match lispLeadWhite			contained			"^\s\+"

" ---------------------------------------------------------------------
" Standard Lisp Functions and Macros: {{{1
syn keyword lispFunc		* list + - / let write print open close if

syn keyword lispPrimitive		nil true

syn match   lispFunc		"\<c[ad]\+r\>"

" ---------------------------------------------------------------------
" Lisp Keywords (modifiers): {{{1
syn keyword lispKey		:abort				:from-end			:overwrite

" ---------------------------------------------------------------------
" Standard Lisp Variables: {{{1
syn keyword lispVar		*applyhook*			*load-pathname*			*print-pprint-dispatch*

" ---------------------------------------------------------------------
" Strings: {{{1
syn region			lispString			start=+"+ skip=+\\\\\|\\"+ end=+"+	contains=@Spell
if exists("g:lisp_instring")
 syn region			lispInString			keepend matchgroup=Delimiter start=+"(+rs=s+1 skip=+|.\{-}|+ matchgroup=Delimiter end=+)"+ contains=@lispBaseListCluster,lispInStringString
 syn region			lispInStringString		start=+\\"+ skip=+\\\\+ end=+\\"+ contained
endif

" ---------------------------------------------------------------------
" Shared with Xlisp, Declarations, Macros, Functions: {{{1
syn keyword lispDecl		const var macro function

" ---------------------------------------------------------------------
" Numbers: supporting integers and floating point numbers {{{1
syn match lispNumber		"-\=\(\.\d\+\|\d\+\(\.\d*\)\=\)\([dDeEfFlL][-+]\=\d\+\)\="
syn match lispNumber		"-\=\(\d\+\)"
syn match lispNumber		"0[xX]\=\(\x\+\)"

syn match lispEscapeSpecial		"\*\w[a-z_0-9-]*\*"
syn match lispEscapeSpecial		!#|[^()'`,"; \t]\+|#!
syn match lispEscapeSpecial		!#x\x\+!
syn match lispEscapeSpecial		!#o\o\+!
syn match lispEscapeSpecial		!#b[01]\+!
syn match lispEscapeSpecial		!#\\[ -}\~]!
syn match lispEscapeSpecial		!#[':][^()'`,"; \t]\+!
syn match lispEscapeSpecial		!#([^()'`,"; \t]\+)!
syn match lispEscapeSpecial		!#\\\%(Space\|Newline\|Tab\|Page\|Rubout\|Linefeed\|Return\|Backspace\)!
syn match lispEscapeSpecial		"\<+[a-zA-Z_][a-zA-Z_0-9-]*+\>"

syn match lispConcat		"\s\.\s"
syn match lispParenError	")"

" ---------------------------------------------------------------------
" Comments: {{{1
syn cluster lispCommentGroup	contains=lispTodo,@Spell
syn match   lispComment		"--.*$"				contains=@lispCommentGroup
"syn region  lispCommentRegion	start="--<" end="-->"		contains=lispCommentRegion,@lispCommentGroup
syn keyword lispTodo		contained			todo			todo:		 TODO

" ---------------------------------------------------------------------
" Synchronization: {{{1
syn sync lines=200

" ---------------------------------------------------------------------
" Define Highlighting: {{{1
if !exists("skip_lisp_syntax_inits")

  hi def link lispCommentRegion	lispComment
  hi def link lispAtomNmbr		lispNumber
  hi def link lispAtomMark		lispMark
  hi def link lispInStringString	lispString

  hi def link lispAtom		Identifier
  hi def link lispAtomBarSymbol	Special
  hi def link lispBarSymbol		Special
  hi def link lispComment		Comment
  hi def link lispConcat		Statement
  hi def link lispDecl		Statement
  hi def link lispFunc		Statement
  hi def link lispKey		Type
  hi def link lispMark		Delimiter
  hi def link lispNumber		Number
  hi def link lispParenError		Error
  hi def link lispEscapeSpecial	Type
  hi def link lispString		String
  hi def link lispTodo		Todo
  hi def link lispVar		Statement
  hi def link lispPrimitive		StorageClass

  if exists("g:lisp_rainbow") && g:lisp_rainbow != 0
   if &bg == "dark"
    hi def hlLevel0 ctermfg=red         guifg=red1
    hi def hlLevel1 ctermfg=yellow      guifg=orange1
    hi def hlLevel2 ctermfg=green       guifg=yellow1
    hi def hlLevel3 ctermfg=cyan        guifg=greenyellow
    hi def hlLevel4 ctermfg=magenta     guifg=green1
    hi def hlLevel5 ctermfg=red         guifg=springgreen1
    hi def hlLevel6 ctermfg=yellow      guifg=cyan1
    hi def hlLevel7 ctermfg=green       guifg=slateblue1
    hi def hlLevel8 ctermfg=cyan        guifg=magenta1
    hi def hlLevel9 ctermfg=magenta     guifg=purple1
   else
    hi def hlLevel0 ctermfg=red         guifg=red3
    hi def hlLevel1 ctermfg=darkyellow  guifg=orangered3
    hi def hlLevel2 ctermfg=darkgreen   guifg=orange2
    hi def hlLevel3 ctermfg=blue        guifg=yellow3
    hi def hlLevel4 ctermfg=darkmagenta guifg=olivedrab4
    hi def hlLevel5 ctermfg=red         guifg=green4
    hi def hlLevel6 ctermfg=darkyellow  guifg=paleturquoise3
    hi def hlLevel7 ctermfg=darkgreen   guifg=deepskyblue4
    hi def hlLevel8 ctermfg=blue        guifg=darkslateblue
    hi def hlLevel9 ctermfg=darkmagenta guifg=darkviolet
   endif
  endif

endif

let b:current_syntax = "morphy"

