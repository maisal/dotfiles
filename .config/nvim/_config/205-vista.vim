UsePlugin "vista.vim"

let g:vista_sidebar_width = 40
let g:vista_echo_cursor = 0

" デフォルトの情報ソースをcocにする
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']

nnoremap <silent> <Leader>o :<C-u>Vista!!<CR>
