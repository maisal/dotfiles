" {{{ set filetype
" set filetype for terminal
function! s:bufnew()
    if &buftype == "terminal" && &filetype == ""
        set filetype=terminal
    endif
endfunction

augroup my-terminal
    autocmd!
   " BufNew の時点では 'buftype' が設定されていないので timer イベントでごまかすなど…
    autocmd! BufNew * call timer_start(0, { -> s:bufnew() })
augroup END

" lammps fileの設定
augroup filetypedetect
  au! BufRead,BufNewFile in.*  setfiletype lammps
  au! BufRead,BufNewFile *.lmp setfiletype lammps
augroup END
"}}}

" terminalでは行番号を表示しない
au filetype terminal setlocal nonumber

" pythonではindentを4にする
augroup indent_filetype
  autocmd!
  autocmd Filetype python setlocal tabstop=4 shiftwidth=4 softtabstop=4
augroup END

" fold設定
augroup filetype_fold
  autocmd!
  autocmd Filetype conf setlocal foldmethod=marker
  autocmd Filetype vim setlocal foldmethod=marker
  autocmd Filetype fish setlocal foldmethod=marker
augroup END

"augroup lammps_syntax
"  au  BufNewFile,BufReadPost *.lmp 
"  au  BufNewFile,BufReadPost in.* 
"augroup END
