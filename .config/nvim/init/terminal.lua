function _G.run(...)
  local arg={...}
  print(arg[1])
  if #arg>1 then
    local cmd = table.concat(arg, ' ').."\n"
    vim.fn.chansend(vim.g.current_terminal_job_id,cmd)
  else
    vim.fn.chansend(vim.g.current_terminal_job_id,arg[1].."\n")
  end
end

vim.cmd[[
augroup terminal
  au!
  au TermOpen * command! -nargs=+ Run :lua run(<f-args>)
  au TermOpen * nnoremap <LocalLeader>r :Run 
  au TermOpen * tnoremap <C-[> <C-\><C-n>
  au TermOpen * tnoremap <A-h> <C-\><C-n><C-w>h
  au TermOpen * setlocal nonumber
  "au TermOpen * startinsert
  au TermOpen * let g:current_terminal_job_id=b:terminal_job_id
  au TermEnter * startinsert
  au TermClose * if g:current_terminal_job_id==b:terminal_job_id | unlet g:current_terminal_job_id | endif
augroup end
]]
