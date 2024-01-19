return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    local colors = require("mani.color-my-pencils")
    local colorscheme = require(colors..".colors")
    local colors = {
        blue = "#65D1FF",
        green = "#3EFFDC",
        violet = "#FF61EF",
        yellow = "#FFDA7B",
        red = "#FF4A4A",
        fg = "#c3ccdc",
        bg = "#112638",
        inactive_bg = "#2c3043",
    }

    local my_lualine_theme = {
      normal = {
        a = { bg = colorscheme.bg, fg = colorscheme.fg, gui = "bold" },
        b = { bg = colorscheme.bg, fg = colorscheme.fg },
        c = { bg = colorscheme.bg, fg = colorscheme.fg },
      },
      insert = {
        a = { bg = colors.green, fg = colorscheme.bg, gui = "bold" },
        b = { bg = colorscheme.bg, fg = colorscheme.fg },
        c = { bg = colorscheme.bg, fg = colorscheme.fg },
      },
      visual = {
        a = { bg = colors.blue, fg = colorscheme.bg, gui = "bold" },
        b = { bg = colorscheme.bg, fg = colorscheme.fg },
        c = { bg = colorscheme.bg, fg = colorscheme.fg },
      },
      command = {
        a = { bg = colors.yellow, fg = colorscheme.bg, gui = "bold" },
        b = { bg = colorscheme.bg, fg = colorscheme.fg },
        c = { bg = colorscheme.bg, fg = colorscheme.fg },
      },
      replace = {
        a = { bg = colors.red, fg = colorscheme.bg, gui = "bold" },
        b = { bg = colorscheme.bg, fg = colorscheme.fg },
        c = { bg = colorscheme.bg, fg = colorscheme.fg },
      },
      inactive = {
        a = { bg = colors.inactive_bg, fg = colorscheme.semilightgray, gui = "bold" },
        b = { bg = colorscheme.inactive_bg, fg = colorscheme.semilightgray },
        c = { bg = colorscheme.inactive_bg, fg = colorscheme.semilightgray },
      },
    }

    -- configure lualine with modified theme
    lualine.setup({
      options = {
        theme = my_lualine_theme,
      },
      sections = {
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
      },
    })
  end,
}
