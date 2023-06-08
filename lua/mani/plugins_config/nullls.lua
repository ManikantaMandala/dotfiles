local null_ls = require("null-ls")

null_ls.setup({
    update_in_insert = false,
    debounce = 750,
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.completion.spell,
        null_ls.builtins.code_actions.gitsigns,
    },
})
