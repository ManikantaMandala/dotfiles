return {
	'nvim-treesitter/nvim-treesitter',
	build = "<cmd>TSUpdate",
	dependencies = {
		'nvim-treesitter/playground',
	},
	config = function ()
        require('nvim-treesitter.configs').setup{
            auto_install = true
        }
	end
}
