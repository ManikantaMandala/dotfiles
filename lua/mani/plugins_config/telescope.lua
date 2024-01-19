return {
	"nvim-telescope/telescope.nvim",
	version = "0.1.1",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function ()
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
		vim.keymap.set('n', '<C-p>', builtin.git_files, {})
		vim.keymap.set('n', '<leader>tk', builtin.keymaps, {})
		vim.keymap.set("n", "<leader>cbff", function()
			require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "In [C]urrent [B]uffer [F]uzzy [F]ind" })

		local telescope = require('telescope')
		telescope.setup{
			defaults = {
				prompt_prefix = "$ "
				-- :TODO explore more options
			}
		}
	end
}
