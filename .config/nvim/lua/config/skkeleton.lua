vim.fn['skkeleton#config']({
  databasePath = vim.env.XDG_DATA_HOME .. "/skk/skk.db",
  globalDictionaries = { "~/.local/share/skk/SKK-JISYO.L" },
  sources = { "deno_kv", "skk_dictionary", "google_japanese_input" },
})

vim.keymap.set({ 'i', 'c' }, '<C-j>', '<Plug>(skkeleton-toggle)')
