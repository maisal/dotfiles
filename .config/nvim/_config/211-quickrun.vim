UsePlugin 'vim-quickrun'

let g:quickrun_config = {}

let g:quickrun_config._ = {
      \ 'hook/time/enable':1
      \}

let g:quickrun_config.python ={
      \ 'command': '/usr/local/bin/python3',
      \ 'cmdopt': '-u',
      \ 'input': 'input'
      \}

