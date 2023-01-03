let g:go_def_mapping_enabled = 0
"let g:go_fmt_command = 'goimports'
"let g:go_fmt_fail_silently = 1
"let g:go_term_enabled = 1
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

"let g:go_highlight_build_constraints = 1
"let g:go_highlight_methods = 1
"let g:go_highlight_operators = 1
"let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

"let g:go_auto_sameids = 1
"let g:go_auto_type_info = 1
"let g:go_addtags_transform = "snakecase"
"let g:go_snippet_engine = "neosnippet"

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
noremap <C-d> :GoImports<CR>
