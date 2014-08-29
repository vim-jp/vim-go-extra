if $GOPATH == ''
  finish
endif

let s:rtp = substitute($GOPATH, (has('win32') || has('win64')) ? ';' : ':', ',', 'g')
exe "set rtp+="
\       . globpath(s:rtp, "src/github.com/nsf/gocode/vim")
\ . ',' . globpath(s:rtp, "src/github.com/golang/lint/misc/vim")
\ . ',' . globpath(s:rtp, "src/code.google.com/p/go.tools/cmd/misc/vim")
unlet s:rtp
