vim.filetype.add({
  extension = {
    nu = 'nu',
    instr = 'c',
  },
  filename = {
    ['tsconfig.json'] = 'jsonc',
  },
  pattern = {
    ['.*/git/config.*'] = 'gitconfig',
  },
})
