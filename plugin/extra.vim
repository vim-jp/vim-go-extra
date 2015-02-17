if $GOPATH == ''
  finish
endif

let s:extras = [
\"github.com/nsf/gocode/vim",
\"github.com/golang/lint/misc/vim",
\"code.google.com/p/go.tools/cmd/misc/vim",
\]

function! s:install_extras()
  let gopath = substitute($GOPATH, (has('win32') || has('win64')) ? ';' : ':', ',', 'g')
  let gopath = join(filter(map(s:extras, "
  \  substitute(globpath(gopath, 'src/' . v:val, 0), '\n', ',', 'g')
  \"), 'len(v:val)>0'), ',')
  if len(gopath) > 0
    exec 'set rtp+=' . gopath
  endif
endfunction

call s:install_extras()
delfunction s:install_extras
unlet s:extras
