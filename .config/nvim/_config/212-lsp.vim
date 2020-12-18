UsePlugin 'vim-lsp'

let g:lsp_signs_error = {'text': '❌'}
let g:lsp_signs_warning = {'text': '⚠️'}
let g:lsp_signs_information = {'text': 'i'}
let g:lsp_signs_hint = {'text': '?'}
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_virtual_text_enabled = 0

nmap <silent> <Leader>F :LspDocumentFormat<CR>

au ColorScheme * hi LspErrorHighlight gui=reverse
au ColorScheme * hi LspWarningHighlight gui=underline

if executable('pyls')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'pyls',
    \ 'cmd': {server_info->['pyls']},
    \ 'whitelist': ['python'],
    \ 'workspace_config': {'pyls': {'plugins': {
    \   'pyflakes': {'enabled': v:true},
    \   'pylint': {'enabled': v:false},
    \   'flake8': {'enabled': v:true},
    \   'mypy': {'enabled': v:true},
    \ }}},
    \ })
endif
