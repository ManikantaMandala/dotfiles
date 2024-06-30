return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local lualine = require("lualine")
        local lazy_status = require("lazy.status") -- to configure lazy pending updates count

        local function window()
            return vim.api.nvim_win_get_number(0)
        end

        local colors = require("mani.color-my-pencils")
        -- local colorscheme = require(colors..".colors")
        local colors = {
            blue = "#65D1FF",
            green = "#3EFFDC",
            violet = "#FF61EF",
            magenta = "#FF00FF",
            yellow = "#FFDA7B",
            red = "#FF4A4A",
            fg = "#c3ccdc",
            bg = "#112638",
            inactive_bg = "green",
        }

        local my_lualine_theme = {
            normal = {
                a = { bg = colors.bg, fg = colors.fg, gui = "bold" },
                b = { bg = colors.bg, fg = colors.fg },
                c = { bg = colors.bg, fg = colors.fg },
            },
            insert = {
                a = { bg = colors.red, fg = colors.bg, gui = "bold" },
                b = { bg = colors.bg, fg = colors.fg },
                c = { bg = colors.bg, fg = colors.fg },
            },
            visual = {
                a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
                b = { bg = colors.bg, fg = colors.fg },
                c = { bg = colors.bg, fg = colors.fg },
            },
            command = {
                a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
                b = { bg = colors.bg, fg = colors.fg },
                c = { bg = colors.bg, fg = colors.fg },
            },
            replace = {
                a = { bg = colors.red, fg = colors.bg, gui = "bold" },
                b = { bg = colors.red, fg = colors.fg },
                c = { bg = colors.bg, fg = colors.fg },
            },
            active ={
                a = { bg = colors.bg, fg = colors.semilightgray, gui = "bold" },
                b = { bg = colors.bg, fg = colors.semilightgray },
                c = { bg = colors.bg, fg = colors.semilightgray },
            },
            inactive = {
                a = { bg = colors.bg, fg = colors.semilightgray, gui = "bold" },
                b = { bg = colors.bg, fg = colors.semilightgray },
                c = { bg = colors.bg, fg = colors.semilightgray },
            },
        }

        -- configure lualine with modified theme
        lualine.setup({
            options = {
                icons_enable = true,
                theme = my_lualine_theme,
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
    end,
}
