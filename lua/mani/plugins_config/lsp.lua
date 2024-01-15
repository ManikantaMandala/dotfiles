local servers = { "eslint", "grammarly", "jsonls", "lua_ls","tsserver", "rust_analyzer" }
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require("mason-lspconfig").setup({
    ensure_installed = servers,
})

    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, {})
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, {})
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, {})
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, {})
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, {})
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, {})
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, {})
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})
    vim.keymap.set('n', '<leader>gf', function()
        vim.lsp.buf.format { async = true }
    end, {})
local lspconfig = require("lspconfig")
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
    }
end
