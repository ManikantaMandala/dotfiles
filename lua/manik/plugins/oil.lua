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
			},
			win_options = {
				number = false,
				relativenumber = false
			},
		})

		--keymaps
		vim.keymap.set('n', '<leader>pv', '<cmd>Oil<CR>', { desc = "open [P]re[V]iew of directory" })
	end
}
