local lsp=require('lsp-zero')
lsp.preset('recommended')
lsp.ensure_installed({
     'tsserver',
     'eslint',
     'jdtls',
     'sumneko_lua',
})


lsp.nvim_workspace()
lsp.setup()
