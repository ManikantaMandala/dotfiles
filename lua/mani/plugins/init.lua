local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[
    packadd packer.nvim
    ]])
end

--Autocommand that records neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost $nvim_config/lua/mani/plugins/init.lua source <afile> | PackerSync
  autocmd BufWritePost init.lua source <afile>
  augroup end
]])

--protected call(so we dont error out on first use)
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    print("Packer is not working")
    return
end

--Pop-up window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

--Plugins:
return packer.startup(function(use)
    --My plugins
    use("wbthomason/packer.nvim") -- Have packer manage itself
    -- using packer.nvim

    use({
        "goolord/alpha-nvim", -- Neovim startUp page
        requires = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("mani.startup").setup()
        end,
    })

    use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim

    use("jiangmiao/auto-pairs") --auto pairing for backets.

    --use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'} --bufferline at the top.
    -- use { "catppuccin/nvim", as = "catppuccin" }

    -- lualine (bottom statusbar)
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    --nerdtree
    use 'nvim-tree/nvim-tree.lua'

    --color scheme
    use("folke/tokyonight.nvim")        -- tokyonight color scheme.
    use({ "dracula/vim", as = "dracula" }) --dracula color scheme
    use("Shatur/neovim-ayu")
    use "ellisonleao/gruvbox.nvim"
    use "rebelot/kanagawa.nvim"
    use("liuchengxu/space-vim-theme")

    -- navigation
    use("christoomey/vim-tmux-navigator")
    use("theprimeagen/harpoon")

    --gui-notify
    use("rcarriga/nvim-notify") --gui-notification script

    --vimwiki
    use("vimwiki/vimwiki")

    --Tagbar
    use "preservim/tagbar" --give the tags

    -- Telescope
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.0",
        --or                            , branch = '0.1.x',
        requires = { { "nvim-lua/plenary.nvim" } },
    })
    use("BurntSushi/ripgrep")
    use("sharkdp/fd")

    --tree-sitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    })
    use("nvim-treesitter/playground")

    --lsp
    use({
        "VonHeikemen/lsp-zero.nvim",
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },

            -- Snippets
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
        },
    })

    --mfussenegger plugins
    use("mfussenegger/nvim-jdtls")
    use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
    use 'mfussenegger/nvim-lint'

    --nvim development plugin
    use("folke/neodev.nvim")

    --use "p00f/nvim-ts-rainbow"
    use("lewis6991/gitsigns.nvim")

    --css color styling
    use("ap/vim-css-color") --css color capabilities.

    --tracking the file
    use("mbbill/undotree")

    --tpope plugins
    use("tpope/vim-commentary") --for commenting lines in different codes.
    use("tpope/vim-surround")
    use("tpope/vim-fugitive")

    -- indent lines for code
    use("lukas-reineke/indent-blankline.nvim")
    use("jose-elias-alvarez/null-ls.nvim")

    -- formaters
    use("MunifTanjim/prettier.nvim")
    use("sbdchd/neoformat")

    -- Draw structures
    use("gyim/vim-boxdraw")
    use("craigmac/vim-mermaid")

    --nvim-ide for dap
    -- use "ldelossa/nvim-ide"

    --Codeium Neovim plugin -> chatGPT
    -- use 'Exafunction/codeium.vim'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
