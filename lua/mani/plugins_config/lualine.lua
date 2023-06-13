local function window()
    return vim.api.nvim_win_get_number(0)
end

local colorscheme = require('mani.plugins_config.colorscheme')
require('lualine').setup({
    options = {
        icons_enable = true,
        theme = colorscheme,
    },
    sections = {
        lualine_a = {
            window,
            'tabs',
        },
        lualine_b = {
            {
                'filename',
            },
        },
        lualine_c = {
            {
                'branch',
                'diff',
                'diagnostics'
            }
        },
        lualine_x={
            'filetype'
        },
        lualine_z={
            {
                function()
                    return vim.fn["codeium#GetStatusString"]()
                end
            }
        }
    },
})
