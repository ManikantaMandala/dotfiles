return {
  'stevearc/oil.nvim',
  dependencies = {
	  { "echasnovski/mini.icons" }
  },
  config = function ()
	-- oil configuration
	local oil = require("oil")
	oil.setup({
		default_file_explorer = true,
		view_options={
			show_hidden = true
		}
	})

	--keymaps
	vim.keymap.set('n', '<leader>pv', '<cmd>Oil<CR>', { desc = "open [P]re[V]iew of directory" })
  end
}
