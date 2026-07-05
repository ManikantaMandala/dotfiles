return {
  {
    'baliestri/aura-theme',
    lazy = false,
    priority = 1000,
    config = function(plugin)
      vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
    end
  },
  {
    'ajmwagar/vim-deus',
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require('rose-pine').setup({
        disable_background = true,
        styles = {
          italic = false,
        },
      })
    end
  },
  {
    'folke/tokyonight.nvim',
  },
  {
    'dracula/vim',
    name = 'dracula',
  },
  {
    'Shatur/neovim-ayu',
  },
  {
    'ellisonleao/gruvbox.nvim',
  },
  {
    'rebelot/kanagawa.nvim',
  },
  {
    'liuchengxu/space-vim-theme',
  },
}
