return {
	'lewis6991/gitsigns.nvim',
	config = function ()
		local gitsigns_enable = true;
		local gitsigns = require('gitsigns')
		function toggle_gitsigns()
			if gitsigns_enable then
				gitsigns.detach()
			end
			if not gitsigns_enable then
				require('gitsigns').setup()
			end
			gitsigns_enable = not gitsigns_enable
		end
--		require('gitsigns').setup()
		gitsigns.setup()
	end

}
