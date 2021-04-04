if exists('g:google3_config_loaded')
  finish
endif

let g:google3_config_loaded = 1

function! google3#config(...) abort

  if exists('b:in_google3')
    return
  endif

  let b:in_google3 = 1

  if exists('$CITC_ROOT')
    setlocal path=$CITC_ROOT,.
  endif

endfunction
