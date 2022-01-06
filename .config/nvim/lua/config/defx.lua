local cursor = vim.fn.cursor
local line = vim.fn.line
local col = vim.fn.col
local set_keymap = vim.api.nvim_set_keymap
-- local buf_set_keymap = vim.api.nvim_buf_set_keymap
local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(0, ...) end

vim.fn['defx#custom#option']('_', {
    winwidth=40,
    split='vertical',
    direction='topleft',
    show_ignored_files=1,
    toggle=1,
    resume=1,
    columns='indent:git:icons:filename:mark',
  })


vim.cmd[[autocmd FileType defx call v:lua.defx_my_settings()]]

function _G.zj()
  lv = vim.fn['defx#get_candidate']().level
  a=line('.')==line('$') and cursor(1,col('.')) or cursor(line('.')+1,col('.'))
  while vim.fn['defx#get_candidate']().level> math.max(lv-1, 0) do
    a=line('.')==line('$') and cursor(1,col('.')) or cursor(line('.')+1,col('.'))
  end
end

function _G.zk()
  lv = vim.fn['defx#get_candidate']().level
  a=line('.')==1 and cursor(line('$'),col('.')) or cursor(line('.')-1,col('.'))
  while vim.fn['defx#get_candidate']().level>math.max(lv-1, 0) do
    a=line('.')==1 and cursor(line('$'),col('.')) or cursor(line('.')-1,col('.'))
  end
end

function _G.zM()
  while vim.fn['defx#get_candidate']().level>0 do
    _G.zk()
  end
  vim.fn['defx#do_action']('close_tree')
end

function _G.defx_my_settings()
  vim.wo.number=false
	buf_set_keymap('n', '<CR>', 
    [[defx#is_directory() ? defx#do_action('open_directory') : defx#do_action('drop')]], 
    {noremap=true,silent=true,expr=true}
  )
	buf_set_keymap('n', 'P',
    [[defx#do_action('preview')]], 
    {noremap=true,silent=true,expr=true}
  )
	buf_set_keymap('n', 'C', 
    [[defx#do_action('toggle_columns', 'mark:indent:icon:filename:type:size:time')]],
    {noremap=true,silent=true,expr=true}
  )
	buf_set_keymap('n', 'q', 
    [[defx#do_action('quit')]],
    {noremap=true,silent=true,expr=true}
  )
	buf_set_keymap('n', 'h', 
    [[defx#do_action('cd', ['..'])]], 
    {noremap=true,silent=true,expr=true}
  )
	buf_set_keymap('n', 'j', 
    [[line('.') == line('$') ? 'gg' : 'j']],
    {noremap=true,silent=true,expr=true}
  )
	buf_set_keymap('n', 'k', 
    [[line('.') == 1 ? 'G' : 'k']], 
    {noremap=true,silent=true,expr=true}
  )
	buf_set_keymap('n', 'l', 
    [[defx#is_directory() ? defx#do_action('open_tree') : defx#do_action('drop')]],
    {noremap=true,silent=true,expr=true}
  )
	buf_set_keymap('n', '~', 
    [[defx#do_action('cd')]], 
    {noremap=true,silent=true,expr=true}
  )
	buf_set_keymap('n', 'zo', 
    [[defx#do_action('open_tree')]], 
    {noremap=true,silent=true,expr=true}
  )
	buf_set_keymap('n', 'zR', 
    [[defx#do_action('open_tree','recursive')]], 
    {noremap=true,silent=true,expr=true}
  )
	buf_set_keymap('n', 'zc', 
    [[defx#do_action('close_tree')]], 
    {noremap=true,silent=true,expr=true}
  )
	buf_set_keymap('n', 'zM', 
    [[<Cmd>call v:lua.zM()<CR>]], 
    {noremap=true,silent=true}
  )
	buf_set_keymap('n', 'zj', 
    [[<Cmd>call v:lua.zj()<CR>]], 
    {noremap=true,silent=true}
  )
	buf_set_keymap('n', 'zk', 
    [[<Cmd>call v:lua.zk()<CR>]], 
    {noremap=true,silent=true}
  )
end
--vim.cmd[[function! s:defx_my_settings() abort
--	" Define mappings
--	nnoremap <silent><buffer><expr> <CR>
--	\ defx#do_action('open')
--	nnoremap <silent><buffer><expr> c
--	\ defx#do_action('copy')
--	nnoremap <silent><buffer><expr> m
--	\ defx#do_action('move')
--	nnoremap <silent><buffer><expr> p
--	\ defx#do_action('paste')
--	nnoremap <silent><buffer><expr> l
--	\ defx#do_action('open')
--	nnoremap <silent><buffer><expr> E
--	\ defx#do_action('open', 'vsplit')
--	nnoremap <silent><buffer><expr> P
--	\ defx#do_action('preview')
--	nnoremap <silent><buffer><expr> o
--	\ defx#do_action('open_tree', 'toggle')
--	nnoremap <silent><buffer><expr> K
--	\ defx#do_action('new_directory')
--	nnoremap <silent><buffer><expr> N
--	\ defx#do_action('new_file')
--	nnoremap <silent><buffer><expr> M
--	\ defx#do_action('new_multiple_files')
--	nnoremap <silent><buffer><expr> C
--	\ defx#do_action('toggle_columns',
--	\                'mark:indent:icon:filename:type:size:time')
--	nnoremap <silent><buffer><expr> S
--	\ defx#do_action('toggle_sort', 'time')
--	nnoremap <silent><buffer><expr> d
--	\ defx#do_action('remove')
--	nnoremap <silent><buffer><expr> r
--	\ defx#do_action('rename')
--	nnoremap <silent><buffer><expr> !
--	\ defx#do_action('execute_command')
--	nnoremap <silent><buffer><expr> x
--	\ defx#do_action('execute_system')
--	nnoremap <silent><buffer><expr> yy
--	\ defx#do_action('yank_path')
--	nnoremap <silent><buffer><expr> .
--	\ defx#do_action('toggle_ignored_files')
--	nnoremap <silent><buffer><expr> ;
--	\ defx#do_action('repeat')
--	nnoremap <silent><buffer><expr> h
--	\ defx#do_action('cd', ['..'])
--	nnoremap <silent><buffer><expr> ~
--	\ defx#do_action('cd')
--	nnoremap <silent><buffer><expr> q
--	\ defx#do_action('quit')
--	nnoremap <silent><buffer><expr> <Space>
--	\ defx#do_action('toggle_select') . 'j'
--	nnoremap <silent><buffer><expr> *
--	\ defx#do_action('toggle_select_all')
--	nnoremap <silent><buffer><expr> j
--	\ line('.') == line('$') ? 'gg' : 'j'
--	nnoremap <silent><buffer><expr> k
--	\ line('.') == 1 ? 'G' : 'k'
--	nnoremap <silent><buffer><expr> <C-l>
--	\ defx#do_action('redraw')
--	nnoremap <silent><buffer><expr> <C-g>
--	\ defx#do_action('print')
--	nnoremap <silent><buffer><expr> cd
--	\ defx#do_action('change_vim_cwd')
--endfunction
--]])
