return {
  -- 'VonHeikemen/lsp-zero.nvim',
  -- dependencies = {
  --   { 'williamboman/mason.nvim' },
  --   { 'williamboman/mason-lspconfig.nvim' },
  --   { 'neovim/nvim-lspconfig' },
  --   { 'SirVer/ultisnips' },
  --   { 'hrsh7th/cmp-nvim-lsp' },
  --   { 'hrsh7th/nvim-cmp' },
  --   { 'hrsh7th/cmp-vsnip' },
  --   { 'saadparwaiz1/cmp_luasnip' },
  --   { 'hrsh7th/cmp-buffer' },
  --   { 'quangnguyen30192/cmp-nvim-ultisnips' },
  --   { 'dcampos/nvim-snippy' },
  --   { 'dcampos/cmp-snippy' },
  --   -- language linter
  --   { 'onsails/lspkind.nvim' },
  --   { 'prisma/vim-prisma' }
  -- },
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs and related tools to stdpath for Neovim
    -- Mason must be loaded before its dependents so we need to set it up here.
    -- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
    { 'mason-org/mason.nvim',               opts = {} },
    'mason-org/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',

    -- Useful status updates for LSP.
    { 'j-hui/fidget.nvim',                  opts = {} },
    { 'SirVer/ultisnips' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-vsnip' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'hrsh7th/cmp-buffer' },
    { 'quangnguyen30192/cmp-nvim-ultisnips' },
    { 'dcampos/nvim-snippy' },
    { 'dcampos/cmp-snippy' },
    -- language linter
    { 'onsails/lspkind.nvim' },
    { 'prisma/vim-prisma' },

    -- Allows extra capabilities provided by blink.cmp
    -- {'saghen/blink.cmp'},
  },
  config = function()
    -- LPS configuration
    -- local lsp_zero = require('lsp-zero')

    -- local lsp_attach = function(client, bufnr)
    --   lsp_zero.default_keymaps({ buffer = bufnr })
    -- end

    -- lsp_zero.extend_lspconfig({
    --   lsp_attach = lsp_attach,
    --   float_border = 'rounded',
    -- })

    -- Completions
    local cmp = require('cmp')
    -- local cmp_action = require('lsp-zero').cmp_action()
    local lspkind = require('lspkind')

    cmp.setup({
      window = {
        completion = cmp.config.window.bordered({
          border = "rounded"
        }),
        documentation = cmp.config.window.bordered({
          border = "rounded"
        }),
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-space>'] = cmp.mapping.complete(),
        -- ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        -- ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
      }),

      sources = cmp.config.sources({
        { name = 'nvim_lsp',  group_index = 2 },
        { name = 'luasnip',   group_index = 2 },       -- For luasnip users.
        { name = 'copilot',   group_index = 2 },       -- Copilot_cmp
        { name = 'vsnip',     group_index = 2 },       -- For vsnip users.
        { name = 'ultisnips', group_index = 2 },       -- For ultisnips users.
        { name = 'snippy',    group_index = 2 },
        { name = 'buffer',    group_index = 2 },
      }),
      formatting = {
        -- should show the label and the details
        fields = { 'abbr', 'kind', 'menu' },
        expandable_indicator = true,
        format = lspkind.cmp_format({
          mode = "symbol",
          max_width = 50,
          show_labelDetails = true,
          symbol_map = {
            luasnip = "[LuaSnip]",
            Copilot = "[Copilot]",
            nvim_lsp = "[LSP]",
            vsnip = "[VSnip]",
            ultisnips = "[UltiSnips]",
            buffer = "[Buffer]",
            snippy = "[Snippy]",
          }
        })
      },
    })

    -- LSP installation setup
    require('mason').setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    })

    require('mason-lspconfig').setup({
      -- Replace the language servers listed here
      -- with the ones you want to install
      -- ensure_installed = { 'jdtls' },
      automatic_installation = true,
      handlers = {
        -- this first function is the "default handler"
        -- it applies to every language server without a "custom handler"
        function(server_name)
          if server_name == 'noop' then return end
          require('lspconfig')[server_name].setup({})
        end,

        -- this is the "custom handler" for `jdtls`
        -- noop is an empty function that doesn't do anything
        jdtls = 'noop',
      },
    })

    -- lsp_zero.setup()

    -- LSP keymap setup
    vim.diagnostic.config({
      virtual_text = true,
      float = {
        border = "rounded"
      }
    })

    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then return end

        if client:supports_method('textDocument/formatting') then
          -- Format the current buffer on save
          vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = args.buf,
            callback = function()
              vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
            end,
          })
        end
      end,
    })


    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})

    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
    vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, {})
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, {})
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, {})
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, {})
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, {})
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, {})
    vim.keymap.set({ 'n', 'v' }, '<space>cc', vim.lsp.buf.code_action, {})
    vim.keymap.set('n', '<leader>gf', function()
      vim.lsp.buf.format { async = true }
    end, {})
  end
}
