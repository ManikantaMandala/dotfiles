local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"folke/which-key.nvim",
	"folke/neodev.nvim",
	--My plugins
	"wbthomason/packer.nvim", -- Have packer manage itself
	-- using packer.nvim

	"goolord/alpha-nvim", -- Neovim startUp page  ,
    "nvim-tree/nvim-web-devicons",

	"nvim-lua/popup.nvim",  -- An implementation of the Popup API from vim in Neovim

	"jiangmiao/auto-pairs", --auto pairing for backets.

	-- {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'} --bufferline at the top.
	-- { "catppuccin/nvim", as = "catppuccin" }

	-- lualine (bottom statusbar)
	{
		'nvim-lualine/lualine.nvim',
	},
	{
		'realprogrammersusevim/md-to-html.nvim',
		cmd = { 'MarkdownToHTML', 'NewMarkdownToHTML' },
	},

	--nerdtree
	'nvim-tree/nvim-tree.lua',

	--color scheme
	"ajmwagar/vim-deus",
	"folke/tokyonight.nvim",           -- tokyonight color scheme.,
	"dracula/vim", --dracula color scheme
	"Shatur/neovim-ayu",
	"ellisonleao/gruvbox.nvim",
	"rebelot/kanagawa.nvim",
	"liuchengxu/space-vim-theme",

	-- navigation
	"christoomey/vim-tmux-navigator",
	"theprimeagen/harpoon",

	--gui-notify
	"rcarriga/nvim-notify", --gui-notification script

	--vimwiki
	"vimwiki/vimwiki",

	--Tagbar
	"preservim/tagbar", --give the tags

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		-- or                            , branch = '0.1.x',
	},
    "nvim-lua/plenary.nvim",
    "BurntSushi/ripgrep",
	"sharkdp/fd",

	--tree-sitter
    "nvim-treesitter/nvim-treesitter",
	"nvim-treesitter/playground",

	--lsp
    "VonHeikemen/lsp-zero.nvim",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",

    -- Autocompletion
    "hrsh7th/nvim-cmp"  ,
    "hrsh7th/cmp-buffer"  ,
    "hrsh7th/cmp-path"  ,
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lsp" ,
    "hrsh7th/cmp-nvim-lua" ,

    -- Snippets
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
    --mfussenegger plugins
    "mfussenegger/nvim-jdtls",

	--dap
	"mfussenegger/nvim-dap",
	"rcarriga/cmp-dap",
	"rcarriga/nvim-dap-ui",
	'mfussenegger/nvim-lint',
	'theHamsta/nvim-dap-virtual-text',
	'nvim-telescope/telescope-dap.nvim',
	'microsoft/java-debug',

	--nvim development plugin
	"folke/neodev.nvim",

	-- "p00f/nvim-ts-rainbow"
	"lewis6991/gitsigns.nvim",

	--css color styling
	"ap/vim-css-color", --css color capabilities.

	--tracking the file
	"mbbill/undotree",

	--tpope plugins
	"tpope/vim-commentary", --for commenting lines in different codes.,
	"tpope/vim-surround",
	"tpope/vim-fugitive",

	-- indent lines for code
	"lukas-reineke/indent-blankline.nvim",
	"jose-elias-alvarez/null-ls.nvim",

	-- formaters
	-- "MunifTanjim/prettier.nvim",
	"sbdchd/neoformat",

	-- Draw structures
	"gyim/vim-boxdraw",
	-- TODO: implement this
	"craigmac/vim-mermaid",

	--leetcode
	"mbledkowski/neuleetcode.vim",

	--Codeium Neovim plugin -> chatGPT
	"Exafunction/codeium.vim",
})
