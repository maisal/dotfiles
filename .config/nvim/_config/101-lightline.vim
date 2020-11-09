UsePlugin 'lightline.vim'

" lightline
let g:lightline = {
\ 'colorscheme': 'one_kai',
\ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
\ 'subseparator': {'left': "\ue0b1", 'right': "\ue0b3" },
\ 'active': {
\   'left': [ ['mode', 'paste' ],
\             ['cocstatus','currentfunction','readonly','filename','modified','csvcol'],
\           ]
\ },
\ 'component_function': {
\   'cocstatus': 'coc#status',
\   'currentfunction': 'CocCurrentFunction',
\   'csvcol': 'MyCSV'
\ },
\ }

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

function! MyCSV()
  if exists("*CSV_WCol")
    let csv = &ft=~"csv" ? CSV_WCol("Name") . " " . CSV_WCol() : ""
  else
    let csv = ''
  endif
  return csv
endfunc
