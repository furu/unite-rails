"
" gather candidates
"
function! unite#sources#rails#route#candidates(source)
  let target = a:source.source__rails_root . '/config/routes.rb'
  return unite#sources#rails#gather_candidates_file(target)
endfunction
