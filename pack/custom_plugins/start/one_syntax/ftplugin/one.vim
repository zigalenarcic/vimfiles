
if exists("b:did_ftplugin")
  finish
endif

let b:did_ftplugin = 1

setl iskeyword+=+,-,*,=,<,>,.,:,$
setl comments=:--
setl commentstring=--\ %s
setl formatoptions-=t
setl formatoptions+=croql
setl lisp
setl lispwords=function,macro,while,do,bind-do,do-list,do-times

let b:undo_ftplugin = 'setlocal iskeyword< define< formatoptions< comments< commentstring< lispwords<'


