return {
	'VonHeikemen/lsp-zero.nvim',
	dependencies = {
		{ 'williamboman/mason.nvim' },
		{ 'williamboman/mason-lspconfig.nvim' },
		{ 'neovim/nvim-lspconfig' },
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
		{ 'prisma/vim-prisma' }
	},
	config = function()
		local lsp_zero = require('lsp-zero')

		lsp_zero.on_attach(function(client, bufnr)
			-- see :help lsp-zero-keybindings
			-- to learn the available actions
			lsp_zero.default_keymaps({ buffer = bufnr })
		end)

		require('mason').setup({})
		require('mason-lspconfig').setup({
			-- Replace the language servers listed here
			-- with the ones you want to install
			ensure_installed = { 'tsserver', 'rust_analyzer' },
			automatic_installation = true,
			handlers = {
				lsp_zero.default_setup,
			},
		})

		local cmp = require('cmp')
		local cmp_action = require('lsp-zero').cmp_action()
		local lspkind = require('lspkind')

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
				['<C-a>'] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true
				})
			}),
			sources = cmp.config.sources({
				{ name = 'nvim_lsp',  group_index = 2 },
				{ name = 'luasnip',   group_index = 2 }, -- For luasnip users.
				{ name = 'copilot',   group_index = 2 }, -- Copilot_cmp
				{ name = 'vsnip',     group_index = 2 }, -- For vsnip users.
				{ name = 'ultisnips', group_index = 2 }, -- For ultisnips users.
				{ name = 'buffer',    group_index = 2 },
				{ name = 'snippy',    group_index = 2 },
			}),
			formatting = {
				-- should show the label and the details
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
		vim.keymap.set('n', 'gti', vim.lsp.buf.implementation, {})

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
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})
		vim.keymap.set('n', '<leader>gf', function()
			vim.lsp.buf.format { async = true }
		end, {})
	end
}
