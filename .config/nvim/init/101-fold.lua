vim.opt.foldmethod='syntax'
vim.opt.foldcolumn='4'
vim.opt.fillchars='vert:|'
function _G.NeatFoldText()
    line = ' '..vim.fn.getline(vim.v.foldstart)
           :gsub([[^%s*[#"]?%s*]], '')
           :gsub([[%s*[#"]?%s*{{{%d*%s*]], '')..' '
    lines_count = vim.v.foldend - vim.v.foldstart + 1
    lines_count_text = '| '..string.format("%10s", lines_count..' lines')..' |'
    foldchar = vim.fn.matchstr(vim.opt.fillchars, 'fold:\zs.')
    foldtextstart = vim.fn.strpart(string.rep('+', vim.v.foldlevel)
                    ..string.rep(foldchar, vim.v.foldlevel*2)
                    ..line, 0, math.floor((vim.fn.winwidth(0)*2)/3))
    foldtextend = lines_count_text..string.rep(foldchar, 8)
    foldtextlength = string.len(string.gsub(foldtextstart..foldtextend, '.', 'x')) + vim.wo.foldcolumn
    return foldtextstart..string.rep(foldchar, vim.fn.winwidth(0)-foldtextlength)..foldtextend
end
vim.api.nvim_exec([[
au ColorScheme * hi Folded gui=bold term=standout ctermbg=black ctermfg=green guibg=none guifg=lightgreen
au ColorScheme * hi FoldColumn gui=bold term=standout ctermbg=none ctermfg=green guibg=none guifg=lightgreen
set foldtext=v:lua.NeatFoldText()
let javaScript_fold = 1
let php_folding = 1
let sh_fold_enabled = 1
augroup filetype_fold
  autocmd!
  autocmd Filetype conf set foldmethod=marker
  autocmd Filetype vim set foldmethod=marker
  autocmd Filetype fish set foldmethod=marker
augroup END
]], false)
