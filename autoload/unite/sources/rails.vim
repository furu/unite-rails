" TODO
"   rails/command
"     history
"     [command] rake
"
"	  immediately

call unite#util#set_default('g:unite_rails_execute_cmd'  , 'VimShellExecute')

let s:places =[
  \ {'name' : 'model'       , 'type' : 'dir'  , 'path' : '/app/models'          } , 
  \ {'name' : 'controller'  , 'type' : 'dir'  , 'path' : '/app/controllers'     } ,
  \ {'name' : 'view'        , 'type' : 'dir'  , 'path' : '/app/views'           } ,
  \ {'name' : 'helper'      , 'type' : 'dir'  , 'path' : '/app/helpers'         } ,
  \ {'name' : 'mailer'      , 'type' : 'dir'  , 'path' : '/app/mailers'         } ,
  \ {'name' : 'lib'         , 'type' : 'dir'  , 'path' : '/lib'                 } ,
  \ {'name' : 'db'          , 'type' : 'dir'  , 'path' : '/db'                  } ,
  \ {'name' : 'config'      , 'type' : 'dir'  , 'path' : '/config'              } ,
  \ {'name' : 'initializer' , 'type' : 'dir'  , 'path' : '/config/initializers' } ,
  \ {'name' : 'log'         , 'type' : 'dir'  , 'path' : '/log'                 } ,
  \ {'name' : 'javascript'  , 'type' : 'dir'  , 'path' : '/public/javascripts'  } ,
  \ {'name' : 'stylesheet'  , 'type' : 'dir'  , 'path' : '/public/stylesheets'  } ,
  \ {'name' : 'routes'      , 'type' : 'file' , 'path' : '/config/routes.rb'    } ,
  \ {'name' : 'rake'        , 'type' : 'cmd'  , 'cmd'  : 'rake' ,
      \'arguments' : [
      \ {'word' : '--tasks'           ,
      \  'abbr' : '--tasks            - List rake tasks'},
      \ {'word' : '--help'            ,
      \  'abbr' : "--help             - Display rake's help message"},
      \ {'word' : '--version'         ,
      \  'abbr' : "--version          - Display rake's version"},
      \ {'word' : 'about'             ,
      \  'abbr' : "about              - List versions of all Rails frameworks and the environment"},
      \ {'word' : 'db:create'         ,
      \  'abbr' : "db:create          - Create the database from config/database.yml for the current Rails.env (use db:create:all to create all dbs in the config)"},
      \ {'word' : 'db:drop'           ,
      \  'abbr' : "db:drop            - Drops the database for the current Rails.env (use db:drop:all to drop all databases)"},
      \ {'word' : 'db:fixtures:load'  ,
      \  'abbr' : "db:fixtures:load   - Load fixtures into the current environment's database."},
      \ {'word' : 'db:migrate'        ,
      \  'abbr' : "db:migrate         - Migrate the database (options: VERSION=x, VERBOSE=false)."},
      \ {'word' : 'db:migrate:status' ,
      \  'abbr' : "db:migrate:status  - Display status of migrations"},
      \ {'word' : 'db:rollback'       ,
      \  'abbr' : "db:rollback        - Rolls the schema back to the previous version (specify steps w/ STEP=n)."},
      \ {'word' : 'db:schema:dump'    ,
      \  'abbr' : "db:schema:dump     - Create a db/schema.rb file that can be portably used against any DB supported by AR"},
      \ {'word' : 'db:schema:load'    ,
      \  'abbr' : "db:schema:load     - Load a schema.rb file into the database"},
      \ {'word' : 'db:seed'           ,
      \  'abbr' : "db:seed            - Load the seed data from db/seeds.rb"},
      \ {'word' : 'db:setup'          ,
      \  'abbr' : "db:setup           - Create the database, load the schema, and initialize with the seed data (use db:reset to also drop the db first)"},
      \ {'word' : 'db:structure:dump' ,
      \  'abbr' : "db:structure:dump  - Dump the database structure to an SQL file"},
      \ {'word' : 'db:version'        ,
      \  'abbr' : "db:version         - Retrieves the current schema version number"},
      \ {'word' : 'doc:app'           ,
      \  'abbr' : 'doc:app            - Generate docs for the app -- also availble doc:rails, doc:guides, doc:plugins (options: TEMPLATE=/rdoc-template.rb, TITLE="Custom Title")'},
      \ {'word' : 'log:clear'         ,
      \  'abbr' : "log:clear          - Truncates all *.log files in log/ to zero bytes"},
      \ {'word' : 'middleware'        ,
      \  'abbr' : "middleware         - Prints out your Rack middleware stack"},
      \ {'word' : 'notes'             ,
      \  'abbr' : "notes              - Enumerate all annotations (use notes:optimize, :fixme, :todo for focus)"},
      \ {'word' : 'notes:custom'      ,
      \  'abbr' : "notes:custom       - Enumerate a custom annotation, specify with ANNOTATION=CUSTOM"},
      \ {'word' : 'rails:template'    ,
      \  'abbr' : "rails:template     - Applies the template supplied by LOCATION=/path/to/template"},
      \ {'word' : 'rails:update'      ,
      \  'abbr' : "rails:update       - Update both configs and public/javascripts from Rails (or use just update:javascripts or update:configs)"},
      \ {'word' : 'routes'            ,
      \  'abbr' : "routes             - Print out all defined routes in match order, with names."},
      \ {'word' : 'secret'            ,
      \  'abbr' : "secret             - Generate a cryptographically secure secret key (this is typically used to generate a secret for cookie sessions)."},
      \ {'word' : 'stats'             ,
      \  'abbr' : "stats              - Report code statistics (KLOCs, etc) from the application"},
      \ {'word' : 'test'              ,
      \  'abbr' : "test               - Runs test:units, test:functionals, test:integration together (also available: test:benchmark, test:profile, test:plugins)"},
      \ {'word' : 'test:recent'       ,
      \  'abbr' : 'test:recent        - Run tests for {:recent=>"test:prepare"} / Test recent changes'},
      \ {'word' : 'test:uncommitted'  ,
      \  'abbr' : 'test:uncommitted   - Run tests for {:uncommitted=>"test:prepare"} / Test changes since last checkin (only Subversion and Git)'},
      \ {'word' : 'time:zones:all'    ,
      \  'abbr' : "time:zones:all     - Displays all time zones, also available: time:zones:us, time:zones:local -- filter with OFFSET parameter, e.g., OFFSET=-6"},
      \ {'word' : 'tmp:clear'         ,
      \  'abbr' : "tmp:clear          - Clear session, cache, and socket files from tmp/ (narrow w/ tmp:sessions:clear, tmp:cache:clear, tmp:sockets:clear)"},
      \ {'word' : 'tmp:create'        ,
      \  'abbr' : "tmp:create         - Creates tmp directories for sessions, cache, sockets, and pids"},
      \ ] } ,
  \ {'name' : 'generate'    , 'type' : 'cmd_input'  , 'cmd'  : 'rails generate' ,
      \'arguments' : [
      \ {'word' : 'controller'          },
      \ {'word' : 'generator'           },
      \ {'word' : 'helper'              },
      \ {'word' : 'integration_test'    },
      \ {'word' : 'mailer'              },
      \ {'word' : 'migration'           },
      \ {'word' : 'model'               },
      \ {'word' : 'observer'            },
      \ {'word' : 'performance_test'    },
      \ {'word' : 'plugin'              },
      \ {'word' : 'resource'            },
      \ {'word' : 'scaffold'            },
      \ {'word' : 'scaffold_controller' },
      \ {'word' : 'session_migration'   },
      \ {'word' : 'stylesheets'         },
      \ ] } ,
  \ {'name' : 'destroy'     , 'type' : 'cmd_input'  , 'cmd'  : 'rails destroy' ,
      \'arguments' : [
      \ {'word' : 'controller'          },
      \ {'word' : 'generator'           },
      \ {'word' : 'helper'              },
      \ {'word' : 'integration_test'    },
      \ {'word' : 'mailer'              },
      \ {'word' : 'migration'           },
      \ {'word' : 'model'               },
      \ {'word' : 'observer'            },
      \ {'word' : 'performance_test'    },
      \ {'word' : 'plugin'              },
      \ {'word' : 'resource'            },
      \ {'word' : 'scaffold'            },
      \ {'word' : 'scaffold_controller' },
      \ {'word' : 'session_migration'   },
      \ {'word' : 'stylesheets'         },
      \ ] } ,
  \  ]

let s:source = {}
"
"
function! s:source.gather_candidates(args, context)
  return s:create_sources(self)
endfunction
"
"
let s:source_command = {}
"
"
function! unite#sources#rails#define()
  return map(s:places ,
        \   'extend(copy(s:source),
        \    extend(v:val, {"name": "rails/" . v:val.name,
        \   "description": "candidates from " . v:val.name}))')
endfunction
"
"
function! s:create_sources(source)
  let root = s:rails_root()
  if root == "" | return [] | end

  let type = a:source.type

  if type == 'dir' || type == 'file'
    return s:create_sources_with_file(a:source , root)
  elseif type == 'cmd'
    return s:create_sources_with_cmd(a:source , root)
  elseif type == 'cmd_input'
    return s:create_sources_with_cmd_input(a:source , root)
  else 
   return []
  endif

endfunction
"
"
function! s:create_sources_with_file(source, root)
  let target = a:root . a:source.path

  if isdirectory(target)
    let files = map(split(globpath(target , '**/*.*') , '\n') , '{
          \ "name" : substitute(v:val , target . "/" , "" , "") ,
          \ "path" : v:val
          \ }')
  else
    let files = [{
          \ "name" : fnamemodify(target , ":t") ,
          \ "path" : target
          \ }]
  endif

  return map(files , '{
          \ "word" : v:val.name ,
          \ "kind" : "file" ,
          \ "action__path"      : v:val.path ,
          \ "action__directory" : fnamemodify(v:val.path , ":p:h") ,
          \ }')
endfunction
"
"
function! s:create_sources_with_cmd(source, root)
  return map(a:source.arguments , '{
        \ "word" : v:val.word ,
        \ "abbr" : has_key(v:val , "abbr") ? v:val.abbr : v:val.word ,
        \ "kind" : "command" ,
        \ "action__command" : s:execute_cmd() . a:source.cmd . " " . v:val.word ,
        \ }')
endfunction
"
"
function! s:create_sources_with_cmd_input(source, root)
  return map(a:source.arguments , '{
        \ "word" : v:val.word ,
        \ "abbr" : has_key(v:val , "abbr") ? v:val.abbr : v:val.word ,
        \ "kind" : "command" ,
        \ "action__command" : s:create_cmd_input(a:source.cmd , v:val.word) , 
        \ }')
endfunction
"
"
function! s:create_cmd_input(cmd, word)
  return "call unite#sources#rails#execute_cmd_input('". a:.cmd . "','" . a:word . "')"
endfunction
"
"
function! unite#sources#rails#execute_cmd_input(cmd, word)
  let name = input(a:word . " name : ")
  execute s:execute_cmd() . ' ' . a:cmd . ' ' . a:word . ' ' . name
endfunction
"
"
function! s:execute_cmd()
  if g:unite_rails_execute_cmd == '!'
    return '!'
  else
    return g:unite_rails_execute_cmd . ' '
  endif
endfunction
"
"
function! s:rails_root()
  " TODO
  let dir = finddir("app" , ".;")
  if dir == "" | return "" | endif
  return  dir . "/../" 
endfunction
