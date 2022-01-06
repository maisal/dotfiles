augroup myfiletypedetect
  au!
  au BufNewFile,BufRead *.jl  setfiletype julia
  au BufNewFile,BufRead *.ll  setfiletype llvm
  au BufNewFile,BufRead *.fish  setfiletype fish
  au BufNewFile,BufRead *.plt  setfiletype gnuplot
  au BufNewFile,BufRead *.ipf  setfiletype igorpro
  au BufNewFile,BufRead *latexmkrc  setfiletype perl
augroup END
