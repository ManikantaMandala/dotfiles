return {
    'VonHeikemen/lsp-zero.nvim',
    dependencies ={
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},

        {'neovim/nvim-lspconfig'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-vsnip'},
        {'rafamadriz/friendly-snippets'},
        {'L3MON4D3/LuaSnip'},
        {'quangnguyen30192/cmp-nvim-ultisnips'},
    },
    config = function()
        local lsp_zero = require('lsp-zero')

        lsp_zero.on_attach(function(client, bufnr)
            -- see :help lsp-zero-keybindings
            -- to learn the available actions
            lsp_zero.default_keymaps({buffer = bufnr})
        end)
		

        require('mason').setup({})
        require('mason-lspconfig').setup({
            -- Replace the language servers listed here 
            -- with the ones you want to install
            ensure_installed = {'tsserver', 'rust_analyzer'},
            automatic_installation = true,
            handlers = {
                lsp_zero.default_setup,
            },
        })


        local cmp = require('cmp')
        local cmp_action = require('lsp-zero').cmp_action()

        cmp.setup({
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-space>'] = cmp.mapping.complete(),
                ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                ['<C-b>'] = cmp_action.luasnip_jump_backward(),
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),
                ['<CR>'] = cmp.mapping.confirm({ 
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true 
                })
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'vsnip' }, -- For vsnip users.
                { name = 'luasnip' }, -- For luasnip users.
                { name = 'ultisnips' }, -- For ultisnips users.
            }),
        })

        lsp_zero.set_preferences({
            suggest_lsp_servers = false,
            sign_icons = {
                error = 'E',
                warn = 'W',
                hint = 'H',
                info = 'I'
            }
        })

        lsp_zero.setup()

        vim.diagnostic.config({
            virtual_text = true
        })
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, {})
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, {})
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, {})
        vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, {})
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, {})
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, {})
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, {})
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})
        vim.keymap.set('n', '<leader>gf', function()
            vim.lsp.buf.format { async = true }
        end, {})
    end
}
