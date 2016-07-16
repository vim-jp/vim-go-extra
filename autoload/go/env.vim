let s:cache = {}

function! go#env#cache_clear(key)
  call remove(s:cache, a:key)
endfunction

function! go#env#root()
  if has_key(s:cache, 'root')
    return s:cache['root']
  endif
  if executable('go')
    let root = substitute(system('go env GOROOT'), '\n', '', 'g')
    if v:shell_error
      echomsg '''go env GOROOT'' failed'
      return ''
    endif
  else
    let root = $GOROOT
  endif
  let s:cache['root'] = root
  return root
endfunction
