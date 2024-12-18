return {
	"nvim-telescope/telescope.nvim",
	version = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function ()
		local builtin = require('telescope.builtin')
		local opts = {
			winblend = 10,
		}
        local themes = require('telescope.themes')

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

		local telescope = require('telescope')
		telescope.setup{
			defaults = {
				prompt_prefix = "$ "
				-- :TODO explore more options
			}
		}
	end
}
