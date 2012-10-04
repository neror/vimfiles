" Vim compiler file
" Compiler:	    Mono C# (Unity)
" Maintainer:		Nathan Eror (neror@freetimestudios.com)
" Last Change:	2012 Oct 4
" Version:      1.0

if exists("current_compiler")
  finish
endif
let current_compiler = "unitycs"

if exists(":CompilerSet") != 2
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet errorformat=
	\%f(%l\\,%c):\ %trror\ CS%n:\ %m,
	\%f(%l\\,%c):\ %tarning\ CS%n:\ %m,
	\%-G%.%#Compilation%.%#,
	\%-G%.%#

"CompilerSet makeprg=gmcs -recurse:'*.cs' -lib:/Applications/Unity/Unity.app/Contents/Frameworks/ -lib:/Applications/Unity/Unity.app/Contents/Frameworks/Managed -lib:/Applications/Unity/Unity.app/Contents/Frameworks/Mono.framework/ -r:UnityEngine -r:UnityEditor -nowarn:0169 -target:module
CompilerSet makeprg=make
