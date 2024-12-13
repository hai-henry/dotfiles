return {
  'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},             -- Core LSP support
        {'williamboman/mason.nvim'},           -- LSP installer
        {'williamboman/mason-lspconfig.nvim'}, -- Bridge between Mason and lspconfig

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},        -- Autocompletion plugin
        {'hrsh7th/cmp-nvim-lsp'},    -- LSP completion source
        {'hrsh7th/cmp-buffer'},      -- Buffer completion source
        {'hrsh7th/cmp-path'},        -- Path completion source
        {'saadparwaiz1/cmp_luasnip'}, -- Snippet completion source

        -- Snippets
        {'L3MON4D3/LuaSnip'},             -- Snippet engine
        {'rafamadriz/friendly-snippets'}, -- Predefined snippets
    },
    config = function()
        local lsp = require('lsp-zero')

        -- Use the recommended preset for simplicity
        lsp.preset('recommended')

        -- Ensure Pyright is installed for Python
        lsp.ensure_installed({
            'pyright', -- Python LSP server
        })

        -- Snippet support with nvim-cmp
        local cmp = require('cmp')
        local cmp_mappings = lsp.defaults.cmp_mappings({
            ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
            ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
        })

        lsp.setup_nvim_cmp({
            mapping = cmp_mappings,
        })

        -- LSP on_attach function for keymaps
        lsp.on_attach(function(_, bufnr)
            local opts = { buffer = bufnr, remap = false }
            local keymap = vim.keymap.set

            keymap('n', 'gd', vim.lsp.buf.definition, opts)
            keymap('n', 'K', vim.lsp.buf.hover, opts)
            keymap('n', '<leader>ca', vim.lsp.buf.code_action, opts)
            keymap('n', '<leader>rn', vim.lsp.buf.rename, opts)
            keymap('n', '<leader>d', vim.diagnostic.open_float, opts)
            keymap('n', '[d', vim.diagnostic.goto_prev, opts)
            keymap('n', ']d', vim.diagnostic.goto_next, opts)
        end)

        -- Finalize LSP setup
        lsp.setup()

        -- Diagnostics configuration
        vim.diagnostic.config({
            virtual_text = true,
            signs = true,
            update_in_insert = false,
        })
    end,
}
