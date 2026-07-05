return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- optional but recommended
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  config = function ()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")
    local opts = {
      winblend = 10,
    }
    local themes = require('telescope.themes')

    telescope.load_extension("fzf")
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<C-p>', builtin.git_files, {})
    vim.keymap.set('n', '<leader>tk', builtin.keymaps, {})
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    vim.keymap.set("n", "<leader>cbff", function()
      builtin.current_buffer_fuzzy_find(themes.get_dropdown(opts))
    end, { desc = "In [C]urrent [B]uffer [F]uzzy [F]ind" })

    vim.keymap.set("n", "<leader>lg",function ()
      builtin.live_grep(themes.get_ivy(opts))
    end , { desc = "open [L]ive [G]rep" })

    vim.keymap.set("n", "<leader>bi", "<cmd>Telescope builtin<cr>", { desc = "open [B]uilt [I]n" })

    vim.keymap.set("n", "<leader>en", function ()
      builtin.find_files(themes.get_ivy{
        cwd = vim.fn.stdpath("config")
      })
    end, { desc = "[E]dit [N]eovim config" })

    vim.keymap.set("n", "<leader>oh", function ()
      builtin.help_tags(themes.get_dropdown({}))
    end, { desc = "[O]pen [H]elp" })

    vim.keymap.set("n", "<leader>ep", function ()
      builtin.find_files(themes.get_ivy{
        -- cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
        cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
      })
    end, { desc = "[E]dit [N]eovim config" })

    telescope.setup{
      defaults = {
        prompt_prefix = "$ "
      },
      extensions = {
        fzf = {}
      }
    }
  end
}
