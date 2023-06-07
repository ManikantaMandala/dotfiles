local function window()
  return vim.api.nvim_win_get_number(0)
end

require('lualine').setup({
    options={
        icons_enable = true,
        theme = "ayu",
    },
    sections={
        lualine_a = {
            {
                'filename',
                path = 1,
            },
            window
        }
    }
})

