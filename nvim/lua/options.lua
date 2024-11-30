-- Leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = false
vim.opt.fillchars = {eob = ' '}

-- Enable mouse
vim.opt.mouse = 'a'

-- Tab width
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

vim.cmd('set guicursor=n-v-c-i:block')
vim.cmd('set wrap!')

-- Set colour theme
vim.cmd("colorscheme tokyonight")
vim.cmd [[
    highlight Normal guibg=none
    highlight NonText guibg=none
    highlight Normal ctermbg=none
    highlight NonText ctermbg=none
]]
