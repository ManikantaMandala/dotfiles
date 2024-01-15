local M = {}

function M.setup()
    local status_ok, alpha = pcall(require, "alpha")
    if not status_ok then
        return
    end

    local dashboard = require "alpha.themes.dashboard"
    dashboard.section.header.val = {
        [[        /\          /\          /\       ]],
        [[     /\//\\/\    /\//\\/\    /\//\\/\    ]],
        [[  /\//\\\///\\/\//\\\///\\/\//\\\///\\/\ ]],
        [[ //\\\//\/\\///\\\//\/\\///\\\//\/\\///\\]],
        [[ \\//\/                            \/\\//]],
        [[  | | |         .          .       | | | ]],
        [[  | | |       ';;,.        ::'     | | | ]],
        [[  | | |     ,:::;,,        :ccc,   | | | ]],
        [[  | | |    ,::c::,,,,.     :cccc,  | | | ]],
        [[  | | |    ,cccc:;;;;;.    cllll,  | | | ]],
        [[  | | |    ,cccc;.;;;;;,   cllll;  | | | ]],
        [[  | | |    :cccc; .;;;;;;. coooo;  | | | ]],
        [[  | | |    ;llll;   ,:::::'loooo;  | | | ]],
        [[  | | |    ;llll:    ':::::loooo:  | | | ]],
        [[  | | |    :oooo:     .::::llodd:  | | | ]],
        [[  | | |    .;ooo:       ;cclooo:.  | | | ]],
        [[  | | |     .;oc        'coo;..    | | | ]],
        [[  | | |       .'         .,..      | | | ]],
        [[  | | |        '         .         | | | ]],
        [[ //\\/\                            /\//\\]],
        [[ \\///\\/\//\\\///\\/\//\\\///\\/\//\\\//]],
        [[  \/\\///\\\//\/\\///\\\//\/\\///\\\//\/ ]],
        [[      \/\\//\/    \/\\//\/    \/\\//\/   ]],
        [[         \/          \/          \/      ]],
    }

    dashboard.section.buttons.val = {
        dashboard.button("<Leader>ff", "  Find file", ":Telescope find_files <CR>"),
        dashboard.button("nf", "  New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("<Leader>vc", "  Vim Configuration", ":e ~/.config/nvim<CR>"),
        dashboard.button("<Leader>tc", "  Tmux Configuration", ":e ~/.tmux.conf<CR>"),
        dashboard.button("<Leader>zc", "  zsh Configuration", ":e ~/.zshrc<CR>"),
        dashboard.button("<Leader>ll", "   Leetcode problem list", ':execute "e ~/.leetcode" <bar> LeetCodeList<CR>'),
        dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
    }

    local function footer()
        -- Number of plugins
        local total_plugins = #vim.tbl_keys(count)
        local plugins_text = "                "
        .. total_plugins
        .. " plugins"
        .. "   v"
        .. vim.version().major
        .. "."
        .. vim.version().minor
        .. "."
        .. vim.version().patch

        -- Quote
        local fortune = require "alpha.fortune"
        local quote = table.concat(fortune(), "\n")

        return plugins_text .. "\n" .. quote
    end

    dashboard.section.footer.val = footer()

    dashboard.section.footer.opts.hl = "Type"
    dashboard.section.header.opts.hl = "Include"
    dashboard.section.buttons.opts.hl = "Keyword"

    dashboard.opts.opts.noautocmd = true
    alpha.setup(dashboard.opts)
end

return M
