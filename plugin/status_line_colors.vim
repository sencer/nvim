function! s:STLColor(mode)
  if a:mode == 'i'
    hi statusline cterm=reverse ctermfg=108 ctermbg=235
          \ gui=reverse guifg=#87af87 guibg=#262626
  elseif a:mode == 'r'
    hi statusline cterm=reverse ctermfg=131 ctermbg=235
          \ gui=reverse guifg=#af5f5f guibg=#262626
  else
    hi statusline cterm=reverse ctermfg=103 ctermbg=235
          \ gui=reverse guifg=#8787af guibg=#262626
  endif
endfunction

augroup STL
  autocmd!
  autocmd STL InsertEnter  * call <SID>STLColor(v:insertmode)
  autocmd STL InsertChange * call <SID>STLColor(v:insertmode)
  autocmd STL InsertLeave  * call <SID>STLColor('n')
augroup END

call s:STLColor('n')

function! LspStatus() abort
  let l:server_status = luaeval('vim.lsp.buf.server_ready(1)')

  if l:server_status == 'false'
    return 'LSP server not ready'
  endif

  let s:status_strings = []

  function! AddToResult(num, label)
    if a:num > 0
      call add(s:status_strings, a:num . a:label)
    endif
  endfunction

  for lvl in ["Hint", "Information", "Warning", "Error"]
    let l:num_diag = luaeval('vim.lsp.diagnostic.get_count(bufnr, [['.lvl.']])')
    call AddToResult(l:num_diag, lvl[0])
  endfor

  if len(s:status_strings)
    return join(s:status_strings, ' ') . ' | '
  else
    return ''
  endif

endfunction

let &stl='%n [%{substitute(getcwd(), $HOME, "~", "")}] %f%( [%M%R%H]%)%='
let &stl.='%{get(b:, "vista_nearest_method_or_function", "")} %{LspStatus()} '
let &stl.='%P, col %c %y%q'
