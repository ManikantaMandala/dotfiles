local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
	print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

--Autocommand that records neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerSync
  augroup end
]])

--protected call(so we dont error out on first use)
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	print("Packer is not working")
	return
end

--Pop-up window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

--Plugins:
return packer.startup(function(use)
  --My plugins
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs" --auto pairing for backets.
  --color scheme
  use "folke/tokyonight.nvim"   -- tokyonight color scheme.
  use {"dracula/vim",as="dracula"}        --dracula color scheme 
  --gui-notify
  use "rcarriga/nvim-notify" --gui-notification script
  --vimwiki
  use "vimwiki/vimwiki" -- vimwiki
  --cmp plugins
	use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp" --cmp-nvim-lsp
  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
  --Tagbar
  use "preservim/tagbar" --give the tags
  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use "BurntSushi/ripgrep"
  use "sharkdp/fd"
  --tree-sitter
	use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "p00f/nvim-ts-rainbow"
  use "nvim-treesitter/playground"

  use "lewis6991/gitsigns.nvim"
  --lsp
  use 'neovim/nvim-lspconfig'
  --css color styling
  use "ap/vim-css-color" --css color capabilities.  
  --tpope plugins
  use "tpope/vim-commentary" --for commenting lines in different codes.
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
