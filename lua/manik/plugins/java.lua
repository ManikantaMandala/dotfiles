return {
	{
		'nvim-java/nvim-java',
		enabled = false,
		config = function()
			require('java').setup()
		end
	},
	{
		"JavaHello/spring-boot.nvim",
		enabled = false,
		ft = "java",
		dependencies = {
			"mfussenegger/nvim-jdtls", -- or nvim-java, nvim-lspconfig
			"ibhagwan/fzf-lua", -- 可选
		},
		config = function ()
			require('spring_boot').setup({})
		end
	}
}

