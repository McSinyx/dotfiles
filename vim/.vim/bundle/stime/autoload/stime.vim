function! stime#LoadTable(table)
  if filereadable(a:table)
    let table = a:table
  else
    for i in split(&runtimepath, ',')
      let path = i . "/tables/" . a:table
      if filereadable(path)
        let table = path
        break
      endif
    endfor
    if !exists("table")
      echoerr "Input table not found"
    endif
  endif
  let l = []
  let f = readfile(table) 
  let [begun, ended] = [0, 0]
  for i in range(len(f))
    let line = f[i]
    if begun
      if line == 'END_TABLE'
        let ended = 1
        break
      endif
      if line != '' && line[:2] != '###'
        let row = split(line)[:1]
        if len(row) < 2
          echoerr 'File "' . table . '", line ' . (i + 1) . ': no phrase after input_keys found'
        else
          call add(l, split(line)[:1])
        endif
      endif
    else
      if line == 'BEGIN_TABLE'
        let begun = 1
      else
        silent! execute "let " . line
      endif
    endif
  endfor
  if !begun
    echoerr 'File "' . table . '", line ' . (i + 1) . ': BEGIN_TABLE not found'
  elseif !ended
    echoerr 'File "' . table . '", line ' . (i + 1) . ': END_TABLE not found'
  endif
  if exists("ESCAPE_CHAR")
    call add(l, [ESCAPE_CHAR, '<Nop>'])
    call add(l, [ESCAPE_CHAR . ESCAPE_CHAR, ESCAPE_CHAR])
  endif
  if !exists("NAME")
    let NAME = table
  endif
  return [NAME, l]
endfunction

function! stime#Toggle(reloadmapping)
  if exists("b:stime")
    for i in b:stime
      execute "unmap! <buffer>" i
    endfor
    unlet b:stime
    echomsg "Stime is off"
  else
    if !exists("s:time_mappings") || a:reloadmapping
      let [s:time_im, s:time_mappings] = stime#LoadTable(g:stime_table)
    endif
    let b:stime = []
    for [i, j] in s:time_mappings " This plugin cannot yet handle frequencies
      execute "noremap! <buffer>" i j
      call add(b:stime, i)
    endfor
    echomsg "Stime is on. Input table: " . s:time_im
  endif
endfunction
