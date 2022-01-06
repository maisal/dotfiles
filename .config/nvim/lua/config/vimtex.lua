-- must execute after loading vimtex and deoplete
-- vim.cmd[[
-- augroup vimtex
--   au filetype tex ++once call deoplete#custom#var('omni', 'input_patterns', {'tex': g:vimtex#re#deoplete})
-- augroup END
-- ]]
vim.cmd[[
  augroup vimtex
    au filetype tex ++once call ddc#custom#patch_filetype(['tex'], 'sourceOptions', {'omni': {'forceCompletionPattern': g:vimtex#re#deoplete},})
    au filetype tex ++once call ddc#custom#patch_filetype(['tex'], 'sourceParams', {'omni': {'omnifunc': 'vimtex#complete#omnifunc'},})
  augroup END
]]
-- vim.fn['vimtex#init']()
-- vim.fn['ddc#custom#patch_filetype']({'tex'}, 'sourceOptions', {
--   omni={
--     forceCompletionPattern=vim.g['vimtex#re#deoplete']
--   },
-- })
-- vim.fn['ddc#custom#patch_filetype']({'tex'}, 'sourceParams', {
--   omni={
--     omnifunc=vim.fn['vimtex#complete#omnifunc']
--   },
-- })
