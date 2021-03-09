vim.wo.foldmethod='syntax'
vim.wo.foldcolumn='4'
vim.cmd[[
"set fillchars=vert:\|
au ColorScheme * hi Folded gui=bold term=standout ctermbg=black ctermfg=green guibg=none guifg=lightgreen
au ColorScheme * hi FoldColumn gui=bold term=standout ctermbg=none ctermfg=green guibg=none guifg=lightgreen
function! NeatFoldText() "{{{
    let line = ' ' . substitute(getline(v:foldstart), '^\s*[#"]\?\s*\|\s*[#"]\?\s*{{' . '{\d*\s*', '', 'g') . ' '
    let lines_count = v:foldend - v:foldstart + 1
    let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
    let foldchar = matchstr(&fillchars, 'fold:\zs.')
    let foldtextstart = strpart(repeat('+', v:foldlevel) . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
    let foldtextend = lines_count_text . repeat(foldchar, 8)
    let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
    return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction
"}}}
set foldtext=NeatFoldText()
let javaScript_fold = 1
let php_folding = 1
let sh_fold_enabled = 1
augroup filetype_fold
  autocmd!
  autocmd Filetype conf :set foldmethod=marker
  autocmd Filetype vim :set foldmethod=marker
  autocmd Filetype fish :set foldmethod=marker
augroup END
]]
