return {
	{
		dir = "~/plugins/present.nvim",
		enabled = false,
		config = function ()
			local present = require("present")
			present.setup()
		end
	}
}
