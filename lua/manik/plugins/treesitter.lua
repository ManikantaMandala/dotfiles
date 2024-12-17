return {
	'nvim-treesitter/nvim-treesitter',
	build = "<cmd>TSUpdate",
	config = function ()
        require('nvim-treesitter.configs').setup{
			sync_install = false,
            auto_install = true
        }
	end
}
