" Check errcheck command is executable because errcheck desn't provide vim
" plugin it-self.
if exists("b:did_ftplugin_go_errcheck") || !executable("errcheck")
  finish
endif

command! -buffer ErrCheck call s:ErrCheck()

function! s:ErrCheck() abort
  let mx = '\S\+:\d\+:\d\+:[^:]\+:[^:]\+$'
  let lines = system('errcheck ' . shellescape(expand('%:p:h')))
  cexpr join(map(split(lines, "\n"), 'matchstr(v:val, mx)'), "\n")
endfunction

let b:did_ftplugin_go_errcheck = 1

" vim:ts=4:sw=4:et
