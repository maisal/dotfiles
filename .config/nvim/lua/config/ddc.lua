local map = vim.api.nvim_set_keymap

-- use pum.vim
vim.fn['ddc#custom#patch_global']('completionMenu', 'pum.vim')
map('i', '<Tab>', [[pum#visible() ? '<Cmd>call pum#map#insert_relative(+1)<CR>' : (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ? '<Tab>' : ddc#manual_complete()]], {silent=true, expr=true, noremap=true})
map('i', '<S-Tab>', [[<Cmd>call pum#map#insert_relative(-1)<CR>]], {silent=true, noremap=true})
map('i', '<C-n>', [[<Cmd>call pum#map#insert_relative(+1)<CR>]], {silent=true, noremap=true})
map('i', '<C-p>', [[<Cmd>call pum#map#insert_relative(-1)<CR>]], {silent=true, noremap=true})

-- sources
vim.fn['ddc#custom#patch_global']('sources', {'omni', 'nvim-lsp', 'vsnip', 'skkeleton', 'around'})
vim.fn['ddc#custom#patch_global']('sourceOptions',{
  _={
    -- matchers={'matcher_head'},
    -- sorters={'sorter_rank'},
    -- converters={'converter_remove_overlap'},
    matchers={'matcher_fuzzy'},
    sorters={'sorter_fuzzy'},
    converters={'converter_fuzzy'},
    ignoreCase=true,
  },
  omni={mark='O'},
  ['nvim-lsp']={
    mark='lsp',
    forceCompletionPattern=[[\.\w*|:\w*|->\w*]],
  },
  skkeleton={
    mark='skkeleton',
    matchers={'skkeleton'},
    sorters={},
    minAutoCompleteLength=2,
  },
})
vim.fn['ddc#custom#patch_global']('sourceParams', {
  ['nvim-lsp']={
    kindLabels={Class='c'}
  }
})
vim.fn['ddc#enable']()
