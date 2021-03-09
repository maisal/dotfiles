vim.cmd[[
augroup filetypedetect
  au BufNewFile,BufRead *.jl  set filetype=julia
  au BufNewFile,BufRead *.ll  set filetype=llvm
  au BufNewFile,BufRead *.fish  set filetype=fish
augroup END
]]
