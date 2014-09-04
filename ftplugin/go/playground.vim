function! s:open_browser(browser, url)
  let cmd = substitute(a:browser, '%URL%', a:url, 'g')
  if cmd =~ '^!'
    silent! exec cmd
  elseif cmd =~ '^:[A-Z]'
    exec cmd
  else
    silent! call system(cmd)
  endif
endfunction

function! s:playground(bang)
  if len(globpath(&rtp, 'autoload/webapi')) == 0
    echohl ErrorMsg | echomsg "required webapi-vim plugin" | echohl None
    return
  endif
  echon 'Compiling and running...'
  if a:bang =~ '^!'
    let res = webapi#http#post('http://play.golang.org/share',
    \ iconv(join(getline(1, line('$')), "\n"), &encoding, 'utf-8'))
    redraw
    let url = printf('http://play.golang.org/p/%s', res.content)
    echo url
    let browser = get(g:, 'goplayground_open_browser', '')
    if len(browser) > 0
      call s:open_browser(browser, url)
    elseif has('unix') && !has('xterm_clipboard')
      let @" = url
    else
      let @+ = url
    endif
  else
    let res = webapi#http#post('http://play.golang.org/compile', {"body": join(getline(1, line('$')), "\n")})
    redraw
    let obj = webapi#json#decode(res.content)
    if has_key(obj, 'compile_errors') && len(obj.compile_errors)
      echohl WarningMsg | echo obj.compile_errors | echohl None
    elseif has_key(obj, 'output')
      echo obj.output
    endif
  endif
endfunction

if !exists("b:did_ftplugin")
  command! -buffer -bang Playground :call s:playground("<bang>")
  nnoremap <buffer> <localleader>e :Playground<cr>
endif
