return {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
        {
            'L3MON4D3/LuaSnip',
            build = 'make install_jsrregexp',
            dependencies = {},
        },
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
    },

    config = function()
        local cmp = require('cmp')
        local luasnip = require('luasnip')
        luasnip.config.setup {} 

        cmp.setup {
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },

            completion = { completeopt = 'menu,menuone,noinsert' },
            sources = {
                {
                    name = 'lazydev',
                    group_index = 0
                },
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'path' }
            }
        }
    end
}
