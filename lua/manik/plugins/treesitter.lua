return {
  "nvim-treesitter/nvim-treesitter",
  tag = "v0.10.0",
  lazy = false,
  build = "<cmd>TSUpdate",
  config = function()
    vim.opt.runtimepath:append(vim.fn.stdpath("data") .. "/site")
    require("nvim-treesitter").setup({
      sync_install = false,
      auto_install = true,
    })
  end,
}
