local status_ok, lsp_installer=pcall(require,"nvim-lsp-installer")
if not status_ok then
  return
end

lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach =require("mani.lsp.Handlers").on_attach,
    capabilities = require("mani.lsp.Handlers").capabilities,
  }

  if server.name == "cssls" then
    local cssls_opts = require("mani.lsp.settings.cssls")
    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  end

  if server.name == "html" then
    local html_opts =require("mani.lsp.settings.html")
    opts = vim.tbl_deep_extend("force", html_opts, opts)
  end

  if server.name == "pyright" then
    local pyright_opts =require("mani.lsp.settings.pyright")
    opts = vim.tbl_deep_extend("force", pyright_opts, opts)
  end

  if server.name == "sumneko_lua" then
    local sumneko_lua_opts = require("mani.lsp.settings.sumneko_lua")
    opts = vim.tbl_deep_extend("force", sumneko_lua_opts, opts)
  end
  server:setup(opts)
end)
