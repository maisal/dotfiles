UsePlugin 'coc.nvim'

nmap <silent> <space>h :<C-u>call CocAction('doHover')<cr>
nmap <Leader>R <Plug>(coc-references)
nmap <Leader>D <Plug>(coc-definition)
nmap <Leader>F <Plug>(coc-format)
nmap <C-]> <Plug>(coc-references)

au ColorScheme * hi CocErrorSign guifg=red
