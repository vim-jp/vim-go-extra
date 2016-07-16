function! go#env#root()
  if executable('go')
    let root = substitute(system('go env GOROOT'), '\n', '', 'g')
    if v:shell_error
      echomsg '''go env GOROOT'' failed'
    endif
  else
    let root = $GOROOT
  endif
  return root
endfunction
