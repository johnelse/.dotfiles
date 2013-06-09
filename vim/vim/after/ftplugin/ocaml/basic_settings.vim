let b:mw='\<let\>:\<and\>:\(\<in\>\|;;\),'
let b:mw=b:mw . '\<if\>:\<then\>:\<else\>,'
let b:mw=b:mw . '\<\(for\|while\)\>:\<do\>:\<done\>,'
let b:mw=b:mw . '\<\(object\|sig\|struct\|begin\)\>:\<end\>,'
let b:mw=b:mw . '\<\(match\|try\)\>:\<with\>'
let b:match_words=b:mw

setlocal tabstop=2
setlocal shiftwidth=2
setlocal noexpandtab
