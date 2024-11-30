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
    require('plugins/nvim-presence'),

    { 'Bilal2453/luvit-meta', lazy = true },
    {
        'lervag/vimtex',
        lazy = false,

        init = function()
            vim.g.vimtex_view_method = "zathura"
        end
    },
    {
      "christoomey/vim-tmux-navigator",
      cmd = {
        "TmuxNavigateLeft",
        "TmuxNavigateDown",
        "TmuxNavigateUp",
        "TmuxNavigateRight",
        "TmuxNavigatePrevious",
      },
      keys = {
        { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
        { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
        { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
        { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
        { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
      },
    },
--    {
--        'SirVer/ultisnips',
--        lazy = false,
--
--        init = function()
--            vim.g.UltiSnipsExpandTrigger = '<tab>'
--            vim.g.UltiSnipsJumpForwardTrigger = '<tab>'
--            vim.g.UltiSnipsJumpBackwardTrigger = '<s-tab>'
--        end,
--
--        config = function()
--            vim.g.UltiSnipsExpandTrigger = '<tab>'
--            vim.g.UltiSnipsJumpForwardTrigger = '<tab>'
--            vim.g.UltiSnipsJumpBackwardTrigger = '<s-tab>'
--            vim.g.UltiSnipsSnippetDirectories = {'/home/tori/dotfiles/nvim/UltiSnips'}
--        end
--    },
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
    },
    {
      'stevearc/oil.nvim',
      ---@module 'oil'
      ---@type oil.SetupOpts
      opts = {},
      -- Optional dependencies
      dependencies = { { "echasnovski/mini.icons", opts = {} } },
      -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    },
    require('plugins/nvim-lspconfig'),
    require('plugins/nvim-cmp'),
    require('plugins/theme'),
    require('plugins/dashboard-nvim')
})
