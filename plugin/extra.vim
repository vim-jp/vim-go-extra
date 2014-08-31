if $GOPATH == ''
  finish
endif

let s:gopath = substitute($GOPATH, (has('win32') || has('win64')) ? ';' : ':', ',', 'g')
exe "set rtp+="
\       . globpath(s:gopath, "src/github.com/nsf/gocode/vim")
\ . ',' . globpath(s:gopath, "src/github.com/golang/lint/misc/vim")
\ . ',' . globpath(s:gopath, "src/code.google.com/p/go.tools/cmd/misc/vim")
unlet s:gopath
