if $GOPATH == ''
  finish
endif

let s:list_separator = (has('win32') || has('win64')) ? ';' : ':'

exe "set rtp+=" . globpath(substitute($GOPATH, s:list_separator, ',', 'g'), "src/code.google.com/p/go.tools/cmd/misc/vim")
