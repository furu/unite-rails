"
" gather candidates
"
function! unite#sources#rails#gemfile#candidates(source)
  let target = a:source.source__rails_root . '/Gemfile'
  return unite#sources#rails#gather_candidates_file(target)
endfunction
