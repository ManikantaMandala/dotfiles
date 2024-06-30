return {
  "zbirenbaum/copilot-cmp",
  config = function ()
      require("copilot_cmp").setup({
          suggestion = { enabled = false },
          panel = { enabled = false },
          event = { "InsertEnter", "LspAttach" },
         fix_pairs = true
      })
  end
}
