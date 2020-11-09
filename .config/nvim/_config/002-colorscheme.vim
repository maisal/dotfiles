set pumblend=20
set winblend=20

au ColorScheme * hi Comment guifg=darkgrey ctermfg=darkgrey
au ColorScheme * hi Normal guibg=none ctermbg=none
au ColorScheme * hi FoldColumn guibg=none ctermbg=none
au ColorScheme * hi Visual gui=reverse cterm=reverse
au ColorScheme * hi LineNr guibg=none ctermbg=none
au ColorScheme * hi CocWarningSign guibg=blue ctermbg=none
au ColorScheme * hi CocErrorSign guibg=none ctermbg=none
au ColorScheme * hi SignColumn guibg=none ctermbg=none
au ColorScheme * hi Folded gui=bold term=standout ctermbg=black ctermfg=green guibg=none guifg=lightgreen
au ColorScheme * hi FoldColumn gui=bold term=standout ctermbg=none ctermfg=green guibg=none guifg=lightgreen
au ColorScheme * hi StatusLine guibg=none ctermbg=none
au ColorScheme * hi StatusLineNC guibg=none ctermbg=none
au ColorScheme * hi NormalFloat guibg=#333333 ctermbg=black blend=10
au ColorScheme * hi Pmenu guibg=#333333 ctermbg=black blend=10

"全角スペースをハイライト表示
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme       * call ZenkakuSpace()
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif
