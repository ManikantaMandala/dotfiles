return {
	'stevearc/oil.nvim',
	opts = {},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
	config = function ()
		require("oil").setup({
			-- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
			-- Set to false if you still want to use netrw.
			default_file_explorer = true,
			-- Id is automatically added at the beginning, and name at the end
			-- See :help oil-columns
			columns = {
				"icon",
			},
			keymaps = {
				["g?"] = "actions.show_help",
				["<CR>"] = "actions.select",
				["<C-s>"] = "actions.select_vsplit",
				["<C-h>"] = false,
				["<S-h>"] = "actions.select_split",
				["<C-p>"] = false,
				["<S-p>"] = "actions.preview",
				["<C-t>"] = "actions.select_tab",
				["<C-c>"] = "actions.close",
				["<C-l>"] = "actions.refresh",
				["-"] = false,
				["<leaderpv>"] = "actions.parent",
				["_"] = "actions.open_cwd",
				["`"] = "actions.cd",
				["cd"] = "actions.cd",
				["~"] = "actions.tcd",
				["tcd"] = "actions.tcd",
				["gs"] = "actions.change_sort",
				["gx"] = "actions.open_external",
				["g."] = "actions.toggle_hidden",
				["g\\"] = "actions.toggle_trash",
			},
			view_options = {
				show_hidden = false,
			}
		})
		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
	end
}
-- return {
--   "nvim-tree/nvim-tree.lua",
--   dependencies = { "nvim-tree/nvim-web-devicons" },
--   config = function()
--     local nvimtree = require("nvim-tree")

--     -- recommended settings from nvim-tree documentation
--     -- vim.g.loaded_netrw = 1
--     -- vim.g.loaded_netrwPlugin = 1

--     -- change color for arrows in tree to light blue
--     vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#3FC5FF ]])
--     vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#3FC5FF ]])

--     -- configure nvim-tree
--     nvimtree.setup({
--       view = {
--         width = 35,
--         relativenumber = true,
--       },
--       -- change folder arrow icons
--       renderer = {
--         indent_markers = {
--           enable = true,
--         },
--       },
--       -- disable window_picker for
--       -- explorer to work well with
--       -- window splits
--       actions = {
--         open_file = {
--           window_picker = {
--             enable = false,
--           },
--         },
--       },
--       filters = {
--         custom = { ".DS_Store" },
--       },
--       git = {
--         ignore = false,
--       },
--     })

--     -- set keymaps
--     local keymap = vim.keymap -- for conciseness

--     keymap.set("n", "<leader>pv", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
--     keymap.set("n", "<leader>pr", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer
--   end,
-- }
