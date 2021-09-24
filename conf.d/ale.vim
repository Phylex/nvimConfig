let g:ale_completion_enabled = 0
let g:ale_linters_explicit = 1
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_save = 1
let g:ale_virtualtext_cursor = 1
let g:ale_linters = {
			\'python': ['pylint', 'flake8', 'pylsp'],
			\'rust': ['rust-analyzer', 'cargo'],
			\'java': ['checkstyle'],
			\'cpp': ['clangd', 'clangtidy']}
let g:ale_c_parse_compile_commands = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\	'cpp': ['clang-format'],
\	'python': ['autopep8'],
\   'javascript': ['eslint'],
\}
