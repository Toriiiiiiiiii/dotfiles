vim.keymap.set('n', '<leader><leader>', '<Cmd>Oil<CR>', {silent = true})	-- Enter netrw with leader + F
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { silent = true })	-- Exit terminal mode with ESC + ESC

-- Moving between panes
vim.keymap.set('n', '<leader><Right>', '<C-w><Right>', {silent = true}) 
vim.keymap.set('n', '<leader><Left>', '<C-w><Left>', {silent = true})
vim.keymap.set('n', '<leader><Up>', '<C-w><Up>', {silent = true})
vim.keymap.set('n', '<leader><Down>', '<C-w><Down>', {silent = true})

vim.keymap.set('n', '<leader>v', '<Cmd>vsp<CR>', {silent = true})
vim.keymap.set('n', '<leader>h', '<Cmd>sp<CR>', {silent = true})

-- Disable arrow keys
vim.keymap.set('n', '<Left>', '<Nop>')
vim.keymap.set('n', '<Right>', '<Nop>')
vim.keymap.set('n', '<Up>', '<Nop>')
vim.keymap.set('n', '<Down>', '<Nop>')

vim.keymap.set('i', '<Left>', '<Nop>')
vim.keymap.set('i', '<Right>', '<Nop>')
vim.keymap.set('i', '<Up>', '<Nop>')
vim.keymap.set('i', '<Down>', '<Nop>')
