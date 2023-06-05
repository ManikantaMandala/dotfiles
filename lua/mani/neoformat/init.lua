local neoformat = require("neoformat")
neoformat.setup = {
	java = {
		exe = "google-java-format",
		args = { "--a", "-" },
		stdin = true,
	},
}
