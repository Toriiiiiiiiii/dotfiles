-- Install lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    require('plugins/telescope'),
    require('plugins/lazydev'),

    { 'Bilal2453/luvit-meta', lazy = true },
    {
        'lervag/vimtex',
        lazy = false,

        init = function()
            vim.g.vimtex_view_method = "zathura"
        end
    },
    {
        'SirVer/ultisnips',
        lazy = false,

        init = function()
            vim.g.UltiSnipsExpandTrigger = '<tab>'
            vim.g.UltiSnipsJumpForwardTrigger = '<tab>'
            vim.g.UltiSnipsJumpBackwardTrigger = '<s-tab>'
        end,

        config = function()
            vim.g.UltiSnipsExpandTrigger = '<tab>'
            vim.g.UltiSnipsJumpForwardTrigger = '<tab>'
            vim.g.UltiSnipsJumpBackwardTrigger = '<s-tab>'
            vim.g.UltiSnipsSnippetDirectories = {'/home/tori/.vim/UltiSnips'}
        end
    },
    { 'quangnguyen30192/cmp-nvim-ultisnips', lazy=false },

    require('plugins/nvim-lspconfig'),
    require('plugins/nvim-cmp'),
    require('plugins/theme')
})
