function! s:dir(path)
  execute 'silent !mkdir -p ' . a:path
  if v:shell_error == 0
    execute 'edit' a:path
  else
    echohl ErrorMsg
    echomsg 'Failed to create directory'
    echohl None
  endif
endfunction

command! -nargs=1 -complete=dir Dir call s:dir(<q-args>)
